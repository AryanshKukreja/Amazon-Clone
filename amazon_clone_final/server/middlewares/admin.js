const jwt = require('jsonwebtoken');
const UserActivation = require('../models/user'); // Adjust the model name/path if necessary

const admin = async (req, res, next) => {
  try {
    // Retrieve token from request headers
    const token = req.header("x-auth-token");
    if (!token) {
      return res.status(401).json({ msg: "No auth token, access denied" });
    }

    // Verify token
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) {
      return res.status(401).json({ msg: "Token verification failed, authorization denied." });
    }

    // Fetch user details from the database
    const user = await UserActivation.findById(verified.id);
    if (!user) {
      return res.status(404).json({ msg: "User not found" });
    }

    // Check if user has admin privileges
    if (user.type === 'user' || user.type === 'seller') {
      return res.status(403).json({ msg: 'You do not have admin privileges' });
    }

    // Attach user info to request object for use in subsequent middleware or route handlers
    req.user = verified.id;
    req.token = token;

    // Pass control to the next middleware or route handler
    next();
  } catch (err) {
    // Handle errors and send appropriate response
    res.status(500).json({ error: err.message });
  }
};

module.exports = admin;
