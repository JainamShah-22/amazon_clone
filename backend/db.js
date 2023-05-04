const mongoose = require("mongoose");

const dbConnect = async() =>  {
    await mongoose
    .connect(process.env.DATABASE)
    .then(console.log("Succesfully connected to database"))
    .catch(e => console.log(e));
}

module.exports = dbConnect;
