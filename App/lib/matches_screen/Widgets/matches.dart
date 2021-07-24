import 'package:flutter/material.dart';

class Matches extends StatelessWidget {
  Map<String, dynamic> match;
  final String date;
  Matches(this.match, this.date);

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    return match["day"] == date
        ? Container(
            height: 0.3302 * c,
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 0.000508 * c,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.000450 * c,
                    ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 0.0508 * c,
                      ),
                      child: Text(
                        match["matchTime"],
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 0.0508 * c,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 0.254 * c),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              match["team1"],
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                                fontSize: 0.04572 * c,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "vs",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontSize: 0.04572 * c,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              match["team2"],
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                                fontSize: 0.04572 * c,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.0508 * c),
                  child: Text(
                    match["eventName"],
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 0.0254 * c,
                    ),
                  ),
                )
              ],
            ),
          )
        : SizedBox();
  }
}
