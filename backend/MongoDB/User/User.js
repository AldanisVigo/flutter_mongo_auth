import mongoose from 'mongoose'

// Create a user schema
const userSchema = new mongoose.Schema({
    name : String,
    email : String,
    password : String,
})

// Create a model from the schema and export it
export default mongoose.model("User", userSchema)