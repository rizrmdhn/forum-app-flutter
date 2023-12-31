import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/bottom_navigation.dart';
import 'package:forum_app_flutter/model/myUser.dart';
import 'package:forum_app_flutter/model/thread.dart';
import 'package:forum_app_flutter/model/leaderboard.dart';
import 'package:forum_app_flutter/model/user.dart';
import 'package:forum_app_flutter/provider/context.dart';
import 'package:forum_app_flutter/screen/forum_screen.dart';
import 'package:forum_app_flutter/screen/leaderboard_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ContextModel(),
    child: const MyApp(),
  ));
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
  var currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.black,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.white),
          ),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
      ),
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          return Scaffold(
            body: <Widget>[
              LeaderboardScreen(
                width: constraint.maxWidth,
                height: constraint.maxHeight,
              ),
              ForumScreen(
                authUser: authUser,
                width: constraint.maxWidth,
                height: constraint.maxHeight,
              ),
            ][currentPageIndex],
            bottomNavigationBar: CustomBottomNavigation(
              currentPageIndex: currentPageIndex,
              changePage: (int index) {
                setState(
                  () {
                    currentPageIndex = index;
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
