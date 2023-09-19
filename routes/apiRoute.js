const express = require("express");
const router = express.Router();
const db = require("../db");

const {
  authenticateUser,
  checkUserRole,
} = require("../middlewares/authMiddleware");

// CLIENT FUNCTION

router.get(
  "/currentUser",
  authenticateUser,
  checkUserRole("client"),
  (req, res) => {
    res.json(req.user);
  }
);

// VENDOR FUNCTIONS

router.post("/buy", authenticateUser, (req, res) => {
  const { voucherId } = req.body;

  const phone = req.user.phone;

  // Check if the user has enough solde
  const checkSoldeQuery = "SELECT solde FROM users WHERE phone = ?";

  db.query(checkSoldeQuery, [phone], (err, results) => {
    if (err) {
      res.status(500).send("Error checking solde");
    } else if (results.length === 0) {
      res.status(404).send("User not found with the provided ID");
    } else {
      const userSolde = results[0].solde;

      // Fetch the voucher details
      const getVoucherQuery =
        "SELECT code, price, reedemedBy FROM vocher WHERE id = ? AND reedemedBy IS NULL";

      db.query(getVoucherQuery, [voucherId], (err, voucherResults) => {
        if (err) {
          res.status(500).send("Error fetching voucher details");
        } else if (voucherResults.length === 0) {
          res.status(404).send("Voucher not found or already redeemed");
        } else {
          const voucher = voucherResults[0];
          const voucherPrice = voucher.price;

          if (userSolde < voucherPrice) {
            res.status(400).send("Insufficient solde to buy this voucher");
          } else {
            const updatedSolde = userSolde - voucherPrice;

            // Update user's solde
            const updateUserSoldeQuery =
              "UPDATE users SET solde = ? WHERE phone = ?";
            db.query(
              updateUserSoldeQuery,
              [updatedSolde, phone],
              (err, updateResult) => {
                if (err || updateResult.affectedRows === 0) {
                  res.status(500).send("Error updating user solde");
                } else {
                  // Mark the voucher as redeemed
                  const updateVoucherQuery =
                    "UPDATE vocher SET reedemedBy = ? WHERE id = ?";
                  db.query(
                    updateVoucherQuery,
                    [phone, voucherId],
                    (err, updateVoucherResult) => {
                      if (err || updateVoucherResult.affectedRows === 0) {
                        res.status(500).send("Error updating voucher");
                      } else {
                        res.status(200).send({ code: voucher.code });
                      }
                    }
                  );
                }
              }
            );
          }
        }
      });
    }
  });
});

// ADMIN FUNCTIONS

router.post("/send", authenticateUser, checkUserRole("admin"), (req, res) => {
  const { receiverPhone, amount } = req.body;
  const senderPhone = req.user.phone;

  // Fetch the existing solde for the sender
  const getSenderSoldeQuery = "SELECT solde FROM users WHERE phone = ?";

  db.query(getSenderSoldeQuery, [senderPhone], (err, senderResults) => {
    if (err) {
      res.status(500).send("Error transferring solde");
    } else if (senderResults.length === 0) {
      res.status(404).send("Sender not found with the provided phone number");
    } else {
      const senderSolde = senderResults[0].solde;
      if (senderSolde < amount) {
        res.status(400).send("Insufficient solde for the sender");
        return;
      }

      // Calculate updated solde for sender and receiver
      const updatedSenderSolde = senderSolde - amount;

      // Update the sender's solde in the database
      const updateSenderSoldeQuery =
        "UPDATE users SET solde = ? WHERE phone = ?";
      db.query(
        updateSenderSoldeQuery,
        [updatedSenderSolde, senderPhone],
        (err, senderUpdateResult) => {
          if (err || senderUpdateResult.affectedRows === 0) {
            res.status(500).send("Error updating sender solde");
          } else {
            // Fetch the existing solde for the receiver
            const getReceiverSoldeQuery =
              "SELECT solde FROM users WHERE phone = ?";
            db.query(
              getReceiverSoldeQuery,
              [receiverPhone],
              (err, receiverResults) => {
                if (err) {
                  res.status(500).send("Error transferring solde");
                } else if (receiverResults.length === 0) {
                  res
                    .status(404)
                    .send("Receiver not found with the provided phone number");
                } else {
                  const receiverSolde = receiverResults[0].solde;
                  const updatedReceiverSolde = receiverSolde + amount;

                  // Update the receiver's solde in the database
                  const updateReceiverSoldeQuery =
                    "UPDATE users SET solde = ? WHERE phone = ?";
                  db.query(
                    updateReceiverSoldeQuery,
                    [updatedReceiverSolde, receiverPhone],
                    (err, receiverUpdateResult) => {
                      if (err || receiverUpdateResult.affectedRows === 0) {
                        res.status(500).send("Error updating receiver solde");
                      } else {
                        transaction(amount, receiverPhone, senderPhone);
                        res.status(200).send("Solde transferred successfully");
                      }
                    }
                  );
                }
              }
            );
          }
        }
      );
    }
  });
});

const transaction = (amount, receiverPhone, senderPhone) => {
  // transactions history
  const insertUserQuery =
    "INSERT INTO transactions (amount, reciverPhone, senderPhone) VALUES (?, ?, ?)";
  db.query(
    insertUserQuery,
    [amount, receiverPhone, senderPhone],
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        console.log("transaction made succesfully");
      }
    }
  );
};

module.exports = router;
