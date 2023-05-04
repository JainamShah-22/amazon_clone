const express = require("express");
const dbConnect = require("./db");

require("dotenv").config();

const app = express();
const PORT = process.env.PORT;

dbConnect();

app.use(express.json());
app.use(require("./routes/auth"));

app.listen(PORT, "0.0.0.0", ()=>{
console.log(`Connected at ${PORT}`);
});