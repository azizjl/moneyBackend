const express = require("express");
const app = express();

const authRoute = require("./routes/authRoute");
const apiRoute = require("./routes/apiRoute");

app.use(express.json());
app.use("/auth", authRoute);
app.use("/api", apiRoute);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
