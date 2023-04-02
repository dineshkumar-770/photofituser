//import from packages
const express = require('express');
const mongoose = require('mongoose');
const PORT = 7000;
const app = express();

const DB = "mongodb+srv://kumardinesh0699:rqgqdcbESqzd8ZH4@cluster0.pelcgup.mongodb.net/?retryWrites=true&w=majority"

//Import from other files
const authRouter = require('./routes/auth.js');

//middleware
app.use(express.json());
app.use(authRouter);

//database mongo DB
mongoose.connect(DB).then(() => {
    console.log('Connection successful');
}).catch((e)=>{
    console.log(e);
});


//CREATING API
//specify PORT number and local host
app.listen(PORT,"0.0.0.0",()=>{
    console.log(`server connected at ${PORT}`);
});

