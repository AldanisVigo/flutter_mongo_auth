import { checkSchema, body } from "express-validator";

export const createUserValidationSchema = checkSchema({
    email : {
        notEmpty: true,
        isEmail: true,
        errorMessage : "Please provide a valid email address.",
    },
    name: {
      notEmpty: true,
      isLength: {
        options: { min: 2 },
        errorMessage: 'Name must be at least 2 characters',
      },
    },
    password: {
      isLength: {
        options: { min: 8 },
        errorMessage: 'Password must be at least 8 characters',
      },
    },
    passwordConfirmation : {
        notEmpty : true,
        errorMessage : "The password confirmation does not match.",
        custom: { // Do a custom validation check
            options : ((value, { req }) => {
                // Make sure the value of the password confirmation matches the password
                if (value !== req.body.password) { 
                    // If they don't match
                    throw new Error(); // Throw an error
                }else{ // Otherwise
                    // Pass the check with true
                    return true
                }
            })
        }
    },
});