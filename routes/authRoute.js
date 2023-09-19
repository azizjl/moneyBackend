const express = require("express");
const router = express.Router();
const mysql = require("mysql");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const db = require("../db");

// Register a new user

router.post("/", (req, res) => {
  res.send("You have accessed the auth route.");
});

router.post("/register", (req, res) => {
  console.log(req.body);
  const { fullName, phone, password } = req.body;

  // Hash the password
  bcrypt.hash(password, 10, (err, hashedPassword) => {
    if (err) {
      res.status(500).send("Error hashing password");
      return;
    }

    // Store the user details in the database
    const insertUserQuery =
      "INSERT INTO users (fullName, phone,  password) VALUES (?, ?, ?)";
    db.query(
      insertUserQuery,
      [fullName, phone, hashedPassword],
      (err, result) => {
        if (err) {
          res.status(500).json(err);
        } else {
          res.status(200).send("User registered successfully");
        }
      }
    );
  });
});

// Login and get a JWT token
router.post("/login", (req, res) => {
  const { phone, password } = req.body;

  // Retrieve the user details from the database
  const getUserQuery = "SELECT * FROM users WHERE phone = ?";
  db.query(getUserQuery, [phone], (err, results) => {
    if (err) {
      res.status(500).send("Error retrieving user");
      return;
    }

    if (results.length === 0) {
      res.status(401).send("Invalid phone number or password");
      return;
    }

    const user = results[0];

    // Compare the provided password with the stored hashed password
    bcrypt.compare(password, user.password, (err, match) => {
      if (err) {
        res.status(500).send("Error comparing passwords");
        return;
      }

      if (!match) {
        res.status(401).send("Invalid username or password");
        return;
      }

      // Create a JWT token
      const token = jwt.sign(
        {
          phone: user.phone,
          fullName: user.fullName,
          solde: user.solde,
          phone: user.phone,
          type: user.type,
        },
        "9ronfel",
        {
          expiresIn: "100h",
        }
      );
      res.status(200).json({ token });
    });
  });
});

module.exports = router;
