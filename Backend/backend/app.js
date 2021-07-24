const express = require("express");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

mongoose.connect({ mongoDB }, { useNewUrlParser: true });

////////////////////////////////////CSGO NEWS////////////////////////
const newsSchema = new mongoose.Schema({
  heading: String,
  articleBy: String,
  articleTime: String,
  headerText: String,
  newsBlock: String,
  imageLink: String,
});

const rankingsSchema = new mongoose.Schema({
  position: String,
  name: String,
  points: String,
  logo: String,
});

const matchSchema = new mongoose.Schema({
  day: String,
  team1: String,
  team2: String,
  matchTime: String,
  eventName: String,
});

const playerRatingsSchema = new mongoose.Schema({
  position: String,
  name: String,
  kd: String,
  rating: String,
});

//////////////////POSTING NEW NEWS/////////////////////////////////

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
      res.send("Successfully deleted all news!");
    } else {
      res.send(err);
    }
  });
});

//////////////////POSTING NEW RANKINGS/////////////////////////////////

app.post("/post/csgo/rankings", function (req, res) {
  const Rankings = mongoose.model("rankings", rankingsSchema);

  const newEntry = new Rankings({
    position: req.body.position,
    name: req.body.name,
    points: req.body.points,
    logo: req.body.logo,
  });

  newEntry.save(function (err) {
    if (err) {
      console.log(err);
    } else {
      res.send("Successfully added new ranking!");
    }
  });
});

////////////////////GETTING ALL RANKINGS///////////////

app.get("/csgo/view/rankings", function (req, res) {
  const Rankings = mongoose.model("rankings", rankingsSchema);
  Rankings.find({}, function (err, foundData) {
    if (err) {
      console.log(err);
    } else {
      res.send(foundData);
    }
  });
});

//////////////////////DELETE ALL RANKINGS/////////////////

app.get("/delete/csgo/rankings", function (req, res) {
  const Rankings = mongoose.model("rankings", rankingsSchema);
  Rankings.deleteMany(function (err) {
    if (!err) {
      res.send("Successfully deleted all rankings!");
    } else {
      res.send(err);
    }
  });
});

////////////////////////POSTING MATCH///////////////////

app.post("/post/csgo/match", function (req, res) {
  const Match = mongoose.model("matches", matchSchema);

  const newEntry = new Match({
    day: req.body.day,
    team1: req.body.team1,
    team2: req.body.team2,
    matchTime: req.body.matchTime,
    eventName: req.body.eventName,
  });

  newEntry.save(function (err) {
    if (err) {
      console.log(err);
    } else {
      res.send("Successfully added new match!");
    }
  });
});

///////////////////////////GETTING MATCH////////////////////

app.get("/csgo/view/match", function (req, res) {
  const Match = mongoose.model("matches", matchSchema);
  Match.find({}, function (err, foundData) {
    if (err) {
      console.log(err);
    } else {
      res.send(foundData);
    }
  });
});

//////////////////////DELETING ALL MATCHES////////////////

app.get("/delete/csgo/match", function (req, res) {
  const Match = mongoose.model("matches", matchSchema);
  Match.deleteMany(function (err) {
    if (!err) {
      res.send("Successfully deleted all matches!");
    } else {
      res.send(err);
    }
  });
});

////////////////////////POSTING NEW PLAYER RATINGS//////////////

app.post("/post/csgo/playerRating", function (req, res) {
  const PlayerRank = mongoose.model("playerRatings", playerRatingsSchema);

  const newEntry = new PlayerRank({
    position: req.body.position,
    name: req.body.name,
    kd: req.body.kd,
    rating: req.body.rating,
  });

  newEntry.save(function (err) {
    if (err) {
      console.log(err);
    } else {
      res.send("Successfully added new player rating!");
    }
  });
});

//////////////////GETTING PLAYER RATINGS/////////////////

app.get("/csgo/view/playerRating", function (req, res) {
  const PlayerRating = mongoose.model("playerRatings", playerRatingsSchema);
  PlayerRating.find({}, function (err, foundData) {
    if (err) {
      console.log(err);
    } else {
      res.send(foundData);
    }
  });
});

//////////////DELETING PLAYER RATINGS/////////////////

app.get("/delete/csgo/playerRating", function (req, res) {
  const PlayerRating = mongoose.model("playerRatings", playerRatingsSchema);
  PlayerRating.deleteMany(function (err) {
    if (!err) {
      res.send("Successfully deleted all player ratings!");
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
