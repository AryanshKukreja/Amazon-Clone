// Import from packages
const express = require('express');
const mongoose = require('mongoose');

// Import from other files
const authRouter = require('./routes/auth.js');

// Init
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://kukrejaaryansh297:Aryansh135791@cluster0.bl0wlmt.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(authRouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log('Connection Successful');
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port ${PORT}`);
});

module.exports = authRouter;
