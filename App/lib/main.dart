import 'package:csgo/error_screen/screens/error_screen.dart';
import 'package:csgo/home_screen/screens/home_screen.dart';
import 'package:csgo/intro_screen/introscreen.dart';
import 'package:csgo/matches_screen/screens/matches_screen.dart';
import 'package:csgo/news_info_screen/screens/news_info_screen.dart';
import 'package:csgo/rankings_screen/rankings_screen.dart';
import 'package:csgo/tabs_screen/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSGO News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/news_info_screen':
            return PageTransition(
              child: NewsInfoScreen(),
              type: PageTransitionType.rightToLeftWithFade,
              settings: settings,
            );
            break;
          default:
            return null;
        }
      },
      routes: {
        "/": (ctx) => TabsScreen(),
        ErrorScreen.routeName: (ctx) => ErrorScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        RankingsScreen.routeName: (ctx) => RankingsScreen(),
        MatchesScreen.routeName: (ctx) => MatchesScreen(),
      },
    );
  }
}

//0.00254
