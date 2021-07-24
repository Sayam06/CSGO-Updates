import 'package:csgo/home_screen/screens/home_screen.dart';
import 'package:csgo/intro_screen/introscreen.dart';
import 'package:csgo/matches_screen/screens/matches_screen.dart';
import 'package:csgo/rankings_screen/rankings_screen.dart';
import 'package:csgo/top_player_screen/screens/top_player_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/tabs-screen";
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> pages = [
    HomeScreen(),
    RankingsScreen(),
    MatchesScreen(),
    TopPlayerScreen(),
  ];

  final List<Map<String, String>> label = [
    // {"title": "IntroScreen"},
    {"title": "News"},
    {"title": "Matches"}
  ];

  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
      pageController.jumpToPage(selectedPageIndex);
    });
  }

  late PageController pageController = PageController(initialPage: selectedPageIndex);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var c = MediaQuery.of(context).size.width;
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: pages,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 0.09), bottom: BorderSide(color: Colors.grey, width: 0.09))),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.black,
              primaryColor: Colors.black,
              textTheme: Theme.of(context).textTheme.copyWith(
                    caption: new TextStyle(color: Colors.black),
                  ),
            ),
            child: BottomNavigationBar(
              onTap: selectPage,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Color.fromRGBO(41, 120, 181, 1),
              currentIndex: selectedPageIndex,
              //showSelectedLabels: false,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  icon: Container(height: 0.05842 * c, child: selectedPageIndex == 0 ? Image.asset("assets/images/News_selected.png") : Image.asset("assets/images/News_unselected.png")),
                  //Icon(Icons.category_outlined),
                  title: Text(
                    "News",
                    style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 0.05842 * c,
                    child: selectedPageIndex == 1 ? Image.asset("assets/images/Rankings_selected.png") : Image.asset("assets/images/Rankings_unselected.png"),
                  ),
                  title: Text("Rankings", style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold)),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      height: 0.05842 * c,
                      child: Image.asset(
                        "assets/images/Matches_selected.png",
                        color: selectedPageIndex == 2 ? Color.fromRGBO(41, 120, 181, 1) : Colors.grey,
                      )),
                  title: Text("Matches", style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold)),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      height: 0.05842 * c,
                      child: Image.asset(
                        "assets/images/Headshot.png",
                        color: selectedPageIndex == 3 ? Color.fromRGBO(41, 120, 181, 1) : Colors.grey,
                      )),
                  title: Text("Top Players", style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
