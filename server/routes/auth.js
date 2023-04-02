const express = require('express');
const User = require("../models/user");
const bcryptjs = require('bcryptjs');
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

//to access above authrouter we need to export it
//to export multiple thing user map like dart
module.exports = authRouter;

