import 'package:csgo/home_screen/screens/home_screen.dart';
import 'package:csgo/tabs_screen/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // bool isLoading = true;
  // int counter = 0;

  // late var allNews;

  // Future getData() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   String newsDataUrl = "https://calm-beyond-54614.herokuapp.com/csgo/view/news";

  //   http.Response response = await http.get(Uri.parse(newsDataUrl), headers: {"Accept": "application/json"});
  //   allNews = json.decode(response.body);
  //   // print(allNews[1]["heading"]);

  //   setState(() {
  //     isLoading = false;
  //   });
  //   Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   // getData();
  // }

  // void refresh() {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(margin: EdgeInsets.only(left: 50), height: 200, child: Image.asset("assets/images/Logo.png")),
      ),
    );
  }
}
