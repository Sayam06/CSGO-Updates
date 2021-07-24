import 'package:flutter/material.dart';

class RankingsTile extends StatelessWidget {
  final Map rankings;

  RankingsTile(this.rankings);

  bool checkSVG(String url) {
    for (int i = 0; i <= url.length - 3; i++) {
      if (url[i] == "s" && url[i + 1] == "v" && url[i + 2] == "g") {
        return true;
      }
    }
    return false;
  }

  String getImage(String s) {
    s.replaceAll(" ", "_");
    return s;
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(bottom: 0.7),
        padding: EdgeInsets.only(top: 0.0508 * c, bottom: 0.0508 * c),
        width: c,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 0.0508 * c),
              child: Text(
                rankings["position"],
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 0.0508 * c,
                ),
              ),
            ),
            Container(
              width: 0.508 * c,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 0.2032 * c),
                    height: 0.127 * c,
                    child: checkSVG(rankings["logo"])
                        ? Image.asset("assets/images/" + getImage(rankings["name"]) + ".png")
                        : Image.network(
                            rankings["logo"],
                          ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0.2032 * c),
                    child: Text(
                      rankings["name"],
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0.0508 * c),
              child: Text(
                rankings["points"],
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
