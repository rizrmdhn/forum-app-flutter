import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/thread.dart';

class CustomBottomNavigation extends StatefulWidget {
  final List<Thread> thread;
  final int currentPageIndex;
  final Function(int) changePage;

  const CustomBottomNavigation({
    Key? key,
    required this.currentPageIndex,
    required this.thread,
    required this.changePage,
  }) : super(key: key);

  @override
  CustomBottomNavigationState createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: widget.changePage,
      selectedIndex: widget.currentPageIndex,
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.leaderboard_outlined),
          selectedIcon: Icon(Icons.leaderboard),
          label: 'Leaderboard',
        ),
        NavigationDestination(
          icon: Icon(Icons.forum_outlined),
          selectedIcon: Icon(Icons.forum),
          label: 'Forum',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
