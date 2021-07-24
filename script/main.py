import requests
from bs4 import BeautifulSoup

parentUrl = "https://www.hltv.org/"

r = requests.get(parentUrl)
htmlContent = r.content

soup = BeautifulSoup(htmlContent, 'html.parser')

allAnchorTags = soup.find_all("a", class_="newsline article")

headlines = []
links = []

finalHeadingsList = []
articleByList = []
articleTimeList = []
headerTextList = []
newsBlockList = []
imageLinkList = []

for info in allAnchorTags:
    if info.div.get_text()[0:6] != "Video:" and info.div.get_text()[0:5] != "[VOD]":
        headlines.append(info.div.get_text())
        links.append("https://www.hltv.org" + info.get("href"))

for link in range(0, 10):
    fullNewsUrl = links[link]
    fullNewsRequest = requests.get(fullNewsUrl)
    fullNewsHtmlContent = fullNewsRequest.content
    fullNewsSoup = BeautifulSoup(fullNewsHtmlContent, 'html.parser')

    headingTitle = fullNewsSoup.find_all("h1", class_="headline")
    finalHeadingsList.append(headingTitle[0].get_text())

    articleBy = fullNewsSoup.find_all("div", class_="author")
    articleByList.append(articleBy[0].get_text())

    articleTime = fullNewsSoup.find_all("div", class_="date")
    articleTimeList.append(articleTime[0].get_text())

    headerText = fullNewsSoup.find_all("p", class_="headertext")
    headerTextList.append(headerText[0].get_text())

    newsBlock = fullNewsSoup.find_all("p", class_="news-block")
    newsBlockText = ""
    for text in newsBlock:
        newsBlockText = newsBlockText + "\n\n\n" + text.get_text()
    newsBlockList.append(newsBlockText)

    imageLink = fullNewsSoup.find_all("div", class_="image-con")
    imageLinkList.append(imageLink[0].img.get("src"))


API_ENDPOINT = "https://calm-beyond-54614.herokuapp.com/post/csgo/news"
deleteData = requests.get(
    "https://calm-beyond-54614.herokuapp.com/delete/csgo/news")
print(deleteData.text)

# sending post request and saving response as response object

for i in range(0, 10):
    data = {'heading': finalHeadingsList[i],
            'articleBy': articleByList[i],
            'articleTime': articleTimeList[i],
            'headerText': headerTextList[i],
            'newsBlock': newsBlockList[i],
            'imageLink': imageLinkList[i],
            }
    sendData = requests.post(url=API_ENDPOINT, data=data)
    print(sendData.text)

# Getting and Uploading World Rank Data
rankingsUrl = "https://www.hltv.org/ranking/teams/2021/july/19"

rankingsRequest = requests.get(rankingsUrl)
rankingsHtmlContent = rankingsRequest.content

rankingsSoup = BeautifulSoup(rankingsHtmlContent, "html.parser")

allSpanTagsName = rankingsSoup.find_all("span", class_="name")
allSpanTagsPosition = rankingsSoup.find_all("span", class_="position")
allSpanTagsPoints = rankingsSoup.find_all("span", class_="points")
allSpanTagsLogo = rankingsSoup.find_all("span", class_="team-logo")

name = []
position = []
points = []
logo = []

for i in range(0, len(allSpanTagsName)):
    position.append(allSpanTagsPosition[i].get_text())
    name.append(allSpanTagsName[i].get_text())
    points.append(allSpanTagsPoints[i].get_text())
    logo.append(allSpanTagsLogo[i].img.get("src"))

RANKINGS_API_ENDPOINT = "https://calm-beyond-54614.herokuapp.com/post/csgo/rankings"
rankingsDeleteData = requests.get(
    "https://calm-beyond-54614.herokuapp.com/delete/csgo/rankings")
print(rankingsDeleteData.text)


for i in range(0, len(allSpanTagsName)):
    rankingsData = {'position': position[i],
                    'name': name[i],
                    'points': points[i],
                    'logo': logo[i],
                    }
    sendData = requests.post(url=RANKINGS_API_ENDPOINT, data=rankingsData)
    print(sendData.text)

# UPDATING UPCOMING MATCHES DETAILS

matchesUrl = "https://www.hltv.org/matches?predefinedFilter=top_tier"

matchesUrlRequest = requests.get(matchesUrl)
matchesHtmlContent = matchesUrlRequest.content

matchesSoup = BeautifulSoup(matchesHtmlContent, 'html.parser')

allMatches = matchesSoup.find_all("div", class_="upcomingMatchesSection")

data = {}

for i in allMatches:
    upcomingMatch = i.find_all("div", class_="upcomingMatch")
    matches = {}
    matchData = []
    for j in range(0, len(upcomingMatch)):
        matches = {
            "matchTime": upcomingMatch[j].find_all(
                "div", class_="matchTime")[0].get_text(),
            "team1": upcomingMatch[j].find_all(
                "div", class_="matchTeamName")[0].get_text(),
            "team2": upcomingMatch[j].find_all(
                "div", class_="matchTeamName")[1].get_text(),
            "eventName": upcomingMatch[j].find_all("div", class_="matchEventName")[0].get_text()
        }
        matchData.append(matches)
    data[i.find_all("span", class_="matchDayHeadline")
         [0].get_text()] = matchData

days = []
matchDetails = []

for key in data.keys():
    days.append(key)

for value in data.values():
    matchDetails.append(value)

MATCH_API_ENDPOINT = "https://calm-beyond-54614.herokuapp.com/post/csgo/match"
deleteMatchData = requests.get(
    "https://calm-beyond-54614.herokuapp.com/delete/csgo/match")

print(deleteMatchData.text)
for i in range(0, len(days)):
    for j in range(0, len(matchDetails[i])):
        matchData = {
            "day": days[i],
            "team1": matchDetails[i][j]["team1"],
            "team2": matchDetails[i][j]["team2"],
            "matchTime": matchDetails[i][j]["matchTime"],
            "eventName": matchDetails[i][j]["eventName"]
        }
        sendMatchData = requests.post(url=MATCH_API_ENDPOINT, data=matchData)
        print(sendMatchData.text)

# Getting Player Ratings

topPlayersUrl = "https://www.hltv.org/stats/players?startDate=2020-07-24&endDate=2021-07-24&rankingFilter=Top20"

topPlayersRequest = requests.get(topPlayersUrl)
topPlayersHtmlContent = topPlayersRequest.content

topPlayersSoup = BeautifulSoup(topPlayersHtmlContent, "html.parser")

allPlayersNames = topPlayersSoup.find_all("td", class_="playerCol")
allPlayersNamesList = []

for i in allPlayersNames:
    allPlayersNamesList.append(i.a.get_text())

# print(allPlayersNamesList)

allPlayersKD = topPlayersSoup.find_all("td", class_="statsDetail")
allPlayersKDList = []

counter = 0
for i in allPlayersKD:
    if counter % 2 == 1:
        allPlayersKDList.append(i.get_text())
    counter = counter + 1

# print(allPlayersKDList)

allPlayersRating = topPlayersSoup.find_all("td", class_="ratingCol")
allPlayersRatingList = []

for i in allPlayersRating:
    allPlayersRatingList.append(i.get_text())

# print(allPlayersRatingList)

PLAYER_RATINGS_API_ENDPOINT = "https://calm-beyond-54614.herokuapp.com/post/csgo/playerRating"
deletePlayerRatings = requests.get(
    "https://calm-beyond-54614.herokuapp.com/delete/csgo/playerRating")
print(deletePlayerRatings.text)

for i in range(0, 20):
    playerRatingsData = {
        "position": str(i + 1),
        "name": allPlayersNamesList[i],
        "kd": allPlayersKDList[i],
        "rating": allPlayersRatingList[i]
    }
    sendPlayerRatingsData = requests.post(
        url=PLAYER_RATINGS_API_ENDPOINT, data=playerRatingsData)
    print(sendPlayerRatingsData.text)
