const express = require('express');
const User = require("../models/user");
const bcryptjs = require('bcryptjs');

//import jwt
const jwt = require('jsonwebtoken');

// .. for main folder repo import
const authRouter = express.Router();




//SIGNUP ROUTE
authRouter.post('/api/signup',async (req, res)=>{
    try {
        //get data from client
    const { name, email, password } = req.body;

    //checking for existing email
    const existingUser = await User.findOne({email});

    if(existingUser){
        return res.status(400).json({msg: "User already exist"});
    }

    //hashing or encrypting password
    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
        email,
        password: hashedPassword,
        name,
    });

    user = await user.save();
    res.json({message: "Signup successful, kindly login!"});

    } catch (error) {
        res.status(500).json({error: `${error}`});
    }
});


//SIGNIN Route

authRouter.post('/api/signin', async (req, res) => {
    try {
        //requesting parameters
        const { email, password } = req.body;


        //checking email in DB if it exists
        const user = await User.findOne({email});
        if(!user){
            return res.status(400).json({
                message: "User not found"
            });
        }

        const isPasswordMatched = await bcryptjs.compare(password, user.password);

        if(isPasswordMatched){
            const token = jwt.sign({id: user._id}, "myjsonwebtokenreturned");
            res.status(200).json({token, ...user._doc});
        }else{
            res.status(401).json({message: "Incorrect password"});
        }


    } catch (error) {
        res.status(500).json({message: `${error}`});
    }
});

//to access above authrouter we need to export it
//to export multiple thing user map like dart
module.exports = authRouter;

