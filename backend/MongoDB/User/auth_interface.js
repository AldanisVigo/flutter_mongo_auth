import userSchema from './User.js'
import bcrypt from 'bcrypt'

export const attemptLogin = async (email, password) => {
    console.log(email)
    // Find the user with the given id.
    try{
        const user = await userSchema.findOne({
            email : email
        });

        if(user != null){

            //Grab the password hash from the user that matches the email address provided.
            const hashedPassword = user.password
    
            // Check with bcrypt if the plaintext password matches the password hash that we have stored.
            const match = await bcrypt.compare(password, hashedPassword)

            if(match){
                // Allow them to login
                return {
                    success: true,
                    name : user.name,
                    email: user.email,
                    id: user.id
                }
    
            }else{
                // Disallow the login attempt
                return false
            }
        }

        //Should be dead code.
        return false
    }catch(err){
        console.error(err)
    }
}