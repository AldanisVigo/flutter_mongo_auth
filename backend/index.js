import express from 'express'
import bodyParser from 'body-parser';
import { connectToDatabase } from './MongoDB/initialize_mongodb.js';
import UserService from './MongoDB/User/user_service.js';
import AuthService from './MongoDB/User/auth_service.js';
import cors from 'cors';

import { attemptLogin } from './MongoDB/User/auth_interface.js';
import { createUser } from './MongoDB/User/user_interface.js';

// import { checkEmailAvailable } from './MongoDB/User/user_interface.js';

// Define the port to run on
const PORT = 3001;

// Create an express app
const app = express();

app.use(cors());

// Use the bodyParser middleware
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

// Connect to the mongodb database
connectToDatabase();

// Use the routes from the user service
app.use(UserService);

// Use the routes from the auth service
app.use(AuthService);

// ABC123@321cba
// createUser("Aldanis Vigo", "aldanisvigo@gmail.com", "ABC123@321cba");

// Start the server
app.listen(PORT,()=>{
    console.log("StagePlug API running on port 3001")
})