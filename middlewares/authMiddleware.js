const jwt = require("jsonwebtoken");

function authenticateUser(req, res, next) {
  const token = req.header("Authorization").split(" ")[1];
  if (!token) {
    return res
      .status(401)
      .json({ message: "Access denied. No token provided." });
  }

  try {
    const decodedToken = jwt.verify(token, "9ronfel");
    req.user = decodedToken; // Store the decoded token in the request object
    next();
  } catch (error) {
    return res.status(401).json({ message: "Invalid token." });
  }
}

function checkUserRole(role) {
  return (req, res, next) => {
    const user = req.user;
    if (user && user.type === role) {
      next();
    } else {
      res
        .status(403)
        .json({ message: "Access denied. Insufficient permissions." });
    }
  };
}

module.exports = {
  authenticateUser,
  checkUserRole,
};
