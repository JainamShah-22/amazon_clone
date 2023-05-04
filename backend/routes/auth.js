const express = require("express");
const router = express.Router();
const User = require("../model/users");
const bcryptjs = require("bcryptjs");

router.post("/api/signup", async (req, res)=>{
    try{
        const {email, password, name} = req.body;
        
        const existingUser = await User.findOne({email});
        
        if(existingUser){
            return res.status(400).json({msg : "User already existis"});
        }
        const newPassword = await bcryptjs.hash(password, 8);

        const newUser = await User.create({email, password : newPassword, name});

        return res.status(200).json(newUser);
    }catch (e){
        res.status(500).json({msg : e.message});
    }
});

router.get("/user", (req, res)=>{
    res.json({message : "Jainam"});
});

module.exports = router;