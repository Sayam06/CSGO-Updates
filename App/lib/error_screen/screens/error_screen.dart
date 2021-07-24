import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  static const routeName = "/error-screen";

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Text(
          "Please check your internet connection :(",
          style: TextStyle(fontFamily: "Montserrat", fontSize: 0.06096 * c, fontWeight: FontWeight.bold, color: Color.fromRGBO(236, 214, 98, 1)),
          textAlign: TextAlign.center,
        )));
  }
}
