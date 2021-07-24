import 'package:flutter/material.dart';
import 'package:csgo/news_info_screen/screens/news_info_screen.dart';
import 'package:page_transition/page_transition.dart';

class NewsInfoScreen extends StatelessWidget {
  static const routeName = "/news-info";
  late var news;

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    final route = ModalRoute.of(context);
    if (route == null)
      return SizedBox();
    else {
      final routeArgs = route.settings.arguments as Map<dynamic, dynamic>;
      news = routeArgs["data"];
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: c,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 0.1016 * c,
                    left: 0.0381 * c,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 0.0762 * c,
                  right: 0.0762 * c,
                  top: 0.0508 * c,
                ),
                width: 0.889 * c,
                child: ClipRRect(
                  child: Image.network(news["imageLink"]),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 0.0508 * c),
                    child: Text(
                      "Report By: " + news["articleBy"],
                      style: TextStyle(color: Colors.white, fontFamily: "Montserrat"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0.0508 * c),
                    child: Text(
                      "Time: " + news["articleTime"],
                      style: TextStyle(color: Colors.white, fontFamily: "Montserrat"),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 0.0508 * c),
                padding: EdgeInsets.only(left: 0.0762 * c, right: 0.0762 * c),
                child: Divider(
                  color: Colors.white,
                  thickness: 0.00254 * c,
                ),
              ),
              SizedBox(
                height: 0.0508 * c,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 0.0762 * c, right: 0.0762 * c),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Text(
                      news["headerText"] + news["newsBlock"] + "\n\n\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontSize: 0.04572 * c,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
