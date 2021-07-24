import 'package:csgo/news_info_screen/screens/news_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NewsTile extends StatelessWidget {
  final Map newsInfo;
  var c;
  NewsTile(
    this.newsInfo,
    this.c,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(bottom: 0.7), //bottom: 0.0762 * c),
          // height: 120,
          width: c,
          decoration: BoxDecoration(
            color: Colors.black,
          ), //border: Border.all(color: Colors.grey, width: 0.1)), // borderRadius: BorderRadiusDirectional.circular(15)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 0.0335 * c, top: 0.0254 * c, bottom: 0.0254 * c),
                height: 0.254 * c,
                width: 0.3556 * c,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  child: Image.network(
                    newsInfo["imageLink"],
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 0.0454 * c, top: 0.0381 * c, bottom: 0.0254 * c),
                      // height: 70,
                      width: 0.4937 * c,
                      child: Text(
                        newsInfo["heading"],
                        style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, fontSize: 0.04572 * c, color: Colors.white),
                      )),
                  Container(
                      margin: EdgeInsets.only(bottom: 0.0254 * c),
                      width: 0.3937 * c,
                      child: Text(
                        newsInfo["articleTime"],
                        style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, fontSize: 0.03048 * c, color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
        onTap: () => Navigator.pushNamed(context, '/news_info_screen', arguments: {"data": newsInfo}));
  }
}
