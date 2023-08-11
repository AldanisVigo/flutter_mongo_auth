import express from 'express'
import { StatusCodes } from 'http-status-codes'
import { attemptLogin } from './auth_interface.js';
const authRouter = express.Router()


// Use the express json middleware for this auth router
authRouter.use(express.json());

authRouter.post('/attemptLogin',async (req,res)=>{
    try {
        // Grab the data from the body of the request
        const email = req.body.email
        const password = req.body.password
        
        // Log the incoming request data
        console.log("Incoming login request with the following data:")
        console.log("Email: " + email)
        console.log("Password: " + password)

        // Attempt to login
        const loginResponse = await attemptLogin(email, password);

        if(loginResponse.success){
            res.status(StatusCodes.OK).json({
                success : true,
                user : loginResponse
            })
        }else{
            res.status(StatusCodes.UNAUTHORIZED).json({
                error : "Could not login with those credentials."
            })
        }

       
    }catch(err){
        console.error(err)
    }
})


// export the auth router
export default authRouter