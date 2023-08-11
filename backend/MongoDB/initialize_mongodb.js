import mongoose from 'mongoose'

export const connectToDatabase = () => {
    // Connect to mongodb
    mongoose.connect("mongodb://localhost/test")
}

