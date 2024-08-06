// Import from packages
const express = require('express');
const mongoose = require('mongoose');

// Import from other files
const authRouter = require('./routes/auth.js');
const adminRouter = require('./routes/admin.js');
const productRouter=require('./routes/product.js');
const userRouter=require('./routes/user.js');

// Init
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://kukrejaaryansh297:<password>@cluster0.bl0wlmt.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

// Connections
mongoose
  .connect(DB, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Connection Successful');
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "192.168.50.21", () => {
  console.log(`Connected at port ${PORT}`);
});
