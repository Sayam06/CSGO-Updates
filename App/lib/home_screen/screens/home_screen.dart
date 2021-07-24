import 'package:csgo/error_screen/screens/error_screen.dart';
import 'package:csgo/home_screen/widgets/news_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {
  bool isLoading = true;
  int counter = 0;

  late var allNews;

  @override
  bool get wantKeepAlive => true;

  Future getData() async {
    setState(() {
      isLoading = true;
    });

    String newsDataUrl = url;

    http.Response response = await http.get(Uri.parse(newsDataUrl), headers: {"Accept": "application/json"});
    allNews = json.decode(response.body);
    // print(allNews[1]["heading"]);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var c = MediaQuery.of(context).size.width;
    counter++;
    Future.delayed(const Duration(seconds: 20), () {
      if (isLoading == true && counter == 1) {
        Navigator.of(context).pushReplacementNamed(ErrorScreen.routeName);
      }
    });

    return Scaffold(
      backgroundColor: Color.fromRGBO(43, 43, 43, 1),
      body: isLoading
          ? Center(
              child: SpinKitSquareCircle(
                color: Colors.white,
                size: 0.127 * c,
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: c,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0.0762 * c, top: 0.127 * c),
                          height: 0.254 * c,
                          child: Image.asset("assets/images/Logo.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0.127 * c),
                          child: Text(
                            "NEWS",
                            style: TextStyle(fontFamily: "Montserrat", fontSize: 0.1016 * c, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 0.0508 * c,
                    ),
                    ...allNews.map((e) {
                      return NewsTile(e, c);
                    }).toList(),
                  ],
                ),
              ),
            ),
    );
  }
}
