import 'package:flutter/material.dart';

class PlayerTile extends StatelessWidget {
  final Map rating;

  PlayerTile(
    this.rating,
  );

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 0.0254 * c),
                child: Text(
                  "# " + rating["position"],
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 0.0508 * c,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 0.0508 * c),
                  width: 0.3429 * c,
                  child: Text(
                    rating["name"],
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 0.0508 * c,
                    ),
                  )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 0.0508 * c),
                width: 0.254 * c,
                child: Text(
                  "K.D.: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontSize: 0.0381 * c,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0.0508 * c),
                width: 0.254 * c,
                child: Text(
                  rating["kd"],
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 0.0508 * c,
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 0.0508 * c),
                width: 0.254 * c,
                child: Text(
                  "Rating: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontSize: 0.0381 * c,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0.0508 * c),
                width: 0.254 * c,
                child: Text(
                  rating["rating"],
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 0.0508 * c,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
