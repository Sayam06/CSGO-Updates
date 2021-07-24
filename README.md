# CSGO Updates

Counter Strike news, matches, ratings and more, at your fingertips.
<br>
<br>
<br>
<p align = "center">
  <img src = "/Logo/Logo.png" height = 200>
  </p>
<br>  

## Description

Made especially for CSGO fans out there, get all the latest news, World Team Rankings, upcoming matches and the list of top professional players, taken directly from HLTV.

All the data is scrapped from HLTV's official website (https://www.hltv.org/) using BeautifulSoup4. The Python script is uploaded on Heroku server and a timer is set, which runs the
script after a fixed interval (set to 1 hr for this app). So all the content is refreshed hourly, this includes news, World Rankings, match timings and the player ratings.

Using the same python script, the data is sent to another server hosted in Heroku(linked with MongoDB) from where it is fetched.

The process is as follows: <br>
Data scraped => All data from the existing server deleted => Fresh data inserted from Python itself(after scraping) => Data fetched by app from the server

The news items are restricted to 10 because HLTV imposes a temporary ip ban if I try to scrape more.

<br>
<br>
<p align = "center">
  <img src = "/Playstore/Feature Graphic.png" height = 400>
  </p>
<br>  
  <p align = "center">
  <img src = "/Playstore/1.png" height = 400>
  </p>
<br> 
  <p align = "center">
  <img src = "/Playstore/2.png" height = 400>
  </p>
<br>  
  <p align = "center">
  <img src = "/Playstore/3.png" height = 400>
  </p>
<br>  
  <p align = "center">
  <img src = "/Playstore/4.png" height = 400>
  </p>
