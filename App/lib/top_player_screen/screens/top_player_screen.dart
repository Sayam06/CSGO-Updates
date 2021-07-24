import 'package:csgo/error_screen/screens/error_screen.dart';
import 'package:csgo/top_player_screen/widgets/player_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TopPlayerScreen extends StatefulWidget {
  const TopPlayerScreen({Key? key}) : super(key: key);

  @override
  _TopPlayerScreenState createState() => _TopPlayerScreenState();
}

class _TopPlayerScreenState extends State<TopPlayerScreen> with AutomaticKeepAliveClientMixin<TopPlayerScreen> {
  @override
  bool get wantKeepAlive => true;

  bool isLoading = true;
  int counter = 0;

  late List<dynamic> allRatings;

  Future getData() async {
    setState(() {
      isLoading = true;
    });

    String newsDataUrl = "https://calm-beyond-54614.herokuapp.com/csgo/view/playerRating";

    http.Response response = await http.get(Uri.parse(newsDataUrl), headers: {"Accept": "application/json"});
    allRatings = json.decode(response.body);
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
    counter++;
    Future.delayed(const Duration(seconds: 20), () {
      if (isLoading == true && counter == 1) {
        Navigator.of(context).pushReplacementNamed(ErrorScreen.routeName);
      }
    });
    var c = MediaQuery.of(context).size.width;
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
                          margin: EdgeInsets.only(
                            top: 0.127 * c,
                            left: 0.0254 * c,
                          ),
                          child: Text(
                            "TOP \nPLAYERS",
                            style: TextStyle(fontFamily: "Montserrat", fontSize: 0.0763 * c, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 0.0508 * c,
                    ),
                    ...allRatings.map((e) => PlayerTile(e))
                  ],
                ),
              ),
            ),
    );
  }
}
