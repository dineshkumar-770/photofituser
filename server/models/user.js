const mongoose = require('mongoose');


//this schema is only for user not for seller
//create DB schema
const userSchema = mongoose.Schema({
    name: {
        require: true,
        type: String,
        trim: true,
    },
    email: {
        require: true,
        type: String,
        trim: true,
        validate: {
            validator: (value)=>{
                const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return value.match(re);
            },
            message : 'Please enter a valid email address'
        }
    },
    password: {
        require: true,
        type: String,
        validate: {
            validator: (value)=>{
                return value.length > 6;
            },
            message : 'Please enter a password with more than 6 Chars'
        }
    },
    address: {
        type: String,
        default: '',
    },
    type: {
        type: String,
        default: 'user',
    }
});

const User = mongoose.model('User', userSchema);

module.exports = User;