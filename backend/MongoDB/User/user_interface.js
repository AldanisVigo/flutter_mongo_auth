import userSchema from './User.js'
import bcrypt from 'bcrypt'

/*
    User interface function for creating a new user.
*/
export const createUser = async (name, email, password) => {
    try {
        //Use bcrypt to hash the password
        const hashedPassword = await bcrypt.hash(password, 10);

        // Create a new user using the mongodb userSchema
        const user = new userSchema({
            name : name,
            email : email,
            password : hashedPassword
        })

        // Wait for the user to be saved.
        await user.save();

        // Let the calling function know the user saved without a hitch.
        return {
            success : true
        }

    } catch ( err ) { // Catch any errors

        // And return them
        return {
            error : err
        }
    }
}

/*
    User interface function for deleting a user using their id.
*/
export const deleteUser = async (id) => {
    try {
        // Wait for the user to be deleted.
        await userSchema.deleteOne({
            _id : id
        })

        // Let the calling function know the user was deleted without a hitch.
        return {
            success : true
        }
    } catch ( err ) { // If any errors are thrown
        // Return them
        return {
            error : err
        }
    }
}

/*
    User interface function for checking if a user exists already based on their email.
*/
export const checkEmailAvailable = async (email) => {
    try {
        // Find the user with the given id.
        const userCount = await userSchema.findOne({
            email : email
        }).count();

        if(userCount > 0){
            return {
                error : "Email already exists."
            }
        }else{
            return {
                matches : userCount,
                success : true
            }
        }
    }catch(err){ // If there are any errors while checking
        return {
            error : err
        }
    }
}
