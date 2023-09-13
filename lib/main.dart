import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/app_bar.dart';
import 'package:forum_app_flutter/components/bottom_navigation.dart';
import 'package:forum_app_flutter/model/thread.dart';
import 'package:forum_app_flutter/model/leaderboard.dart';
import 'package:forum_app_flutter/screen/forum_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Forum App';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final thread = threadList;
  final leaderBoard = leaderBoardList;
  var currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: const CustomAppBar(title: MyApp._title),
        body: <Widget>[
          const Center(
            child: Text('Leaderboard'),
          ),
          ForumScreen(thread: thread),
          const Center(
            child: Text('Settings'),
          ),
        ][currentPageIndex],
        bottomNavigationBar: CustomBottomNavigation(
            thread: thread,
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
