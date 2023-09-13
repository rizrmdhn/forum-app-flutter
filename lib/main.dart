import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/bottom_navigation.dart';
import 'package:forum_app_flutter/model/myUser.dart';
import 'package:forum_app_flutter/model/thread.dart';
import 'package:forum_app_flutter/model/leaderboard.dart';
import 'package:forum_app_flutter/model/user.dart';
import 'package:forum_app_flutter/screen/forum_screen.dart';
import 'package:forum_app_flutter/screen/leaderboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  static const String _title = 'Forum App';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Thread> thread = threadList;
  final List<LeaderBoard> leaderBoard = leaderBoardList;
  final User authUser = myUser;
  var currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: <Widget>[
          LeaderboardScreen(leaderboard: leaderBoard),
          ForumScreen(thread: thread, authUser: authUser),
        ][currentPageIndex],
        bottomNavigationBar: CustomBottomNavigation(
            currentPageIndex: currentPageIndex,
            changePage: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            }),
      ),
    );
  }
}
