import 'package:csgo/error_screen/screens/error_screen.dart';
import 'package:csgo/matches_screen/Widgets/matches.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:expandable/expandable.dart';

class MatchesScreen extends StatefulWidget {
  static const routeName = "/matches-screen";

  @override
  _MatchesScreenState createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> with AutomaticKeepAliveClientMixin<MatchesScreen> {
  bool isLoading = true;
  List<dynamic> dates = [];
  int count = 0;
  int counter = 0;

  late List<dynamic> allMatches;

  void getDates() {
    for (int i = 0; i < allMatches.length; i++) {
      String dd, mm, yyyy, day;
      int l = allMatches[i]["day"].length - 10;
      day = allMatches[i]["day"].substring(0, l);
      dd = allMatches[i]["day"].substring(l + 8, l + 10);
      mm = allMatches[i]["day"].substring(l + 5, l + 7);
      yyyy = allMatches[i]["day"].substring(l, l + 4);
      allMatches[i]["day"] = day + dd + "/" + mm + "/" + yyyy;
      if (count == 0) {
        dates.add(allMatches[i]["day"]);
        count++;
      }
      if (count >= 1 && allMatches[i]["day"] != dates[count - 1]) {
        dates.add(allMatches[i]["day"]);
        count++;
      }
    }
  }

  Future getData() async {
    setState(() {
      isLoading = true;
    });

    String newsDataUrl = url;

    http.Response response = await http.get(Uri.parse(newsDataUrl), headers: {"Accept": "application/json"});
    allMatches = json.decode(response.body);

    setState(() {
      isLoading = false;
    });
    getDates();
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  void refresh() {
    setState(() {});
  }

  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    counter++;
    Future.delayed(const Duration(seconds: 20), () {
      if (isLoading == true && counter == 1) {
        Navigator.of(context).pushReplacementNamed(ErrorScreen.routeName);
      }
    });
    var c = MediaQuery.of(context).size.width;
    return DefaultTabController(
      initialIndex: 0,
      length: dates.length,
      child: Scaffold(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 0.0762 * c, top: 0.127 * c),
                            height: 0.254 * c,
                            child: Image.asset("assets/images/Logo.png"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 0.127 * c,
                                ),
                                child: Text(
                                  "MATCHES",
                                  style: TextStyle(fontFamily: "Montserrat", fontSize: 0.1016 * c, color: Colors.white),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "*local time",
                                  style: TextStyle(fontFamily: "Montserrat", fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 0.0508 * c,
                      ),
                      TabBar(
                        indicatorColor: Colors.white,
                        onTap: selectPage,
                        isScrollable: true,
                        tabs: [
                          ...dates.map((e) => Tab(
                                child: Text(
                                  e[e.length - 10] + e[e.length - 9],
                                ),
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          ...allMatches.map((f) => Matches(f, dates[selectedPageIndex])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
