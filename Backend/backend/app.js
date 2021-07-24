const express = require("express");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

mongoose.connect({ mongoDB }, { useNewUrlParser: true });

const newsSchema = new mongoose.Schema({
  heading: String,
  articleBy: String,
  articleTime: String,
  headerText: String,
  newsBlock: String,
  imageLink: String,
});

app.post("/post/csgo/news", function (req, res) {
  const News = mongoose.model("news", newsSchema);

  const newEntry = new News({
    heading: req.body.heading,
    articleBy: req.body.articleBy,
    articleTime: req.body.articleTime,
    headerText: req.body.headerText,
    newsBlock: req.body.newsBlock,
    imageLink: req.body.imageLink,
  });

  newEntry.save(function (err) {
    if (err) {
      console.log(err);
    } else {
      res.send("Successfully added new entry!");
    }
  });
});
//////////////////GETTING ALL NEWS/////////////////////

app.get("/csgo/view/news", function (req, res) {
  const News = mongoose.model("news", newsSchema);
  News.find({}, function (err, foundData) {
    if (err) {
      console.log(err);
    } else {
      res.send(foundData);
    }
  });
});

//////////////////////DELETING ALL NEWS//////////////////

app.get("/delete/csgo/news", function (req, res) {
  const News = mongoose.model("news", newsSchema);
  News.deleteMany(function (err) {
    if (!err) {
      res.send("Successfully deleted all entries");
    } else {
      res.send(err);
    }
  });
});

let port = process.env.PORT;
if (port == null || port == "") {
  port = 3000;
}

app.listen(port, function () {
  console.log("Server is running on port 3000!");
});
