import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  final int currentPageIndex;
  final Function(int) changePage;

  const CustomBottomNavigation({
    Key? key,
    required this.currentPageIndex,
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
      backgroundColor: const Color.fromARGB(255, 34, 40, 49),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(
            Icons.leaderboard_outlined,
            color: Colors.white,
          ),
          selectedIcon: Icon(
            Icons.leaderboard,
            color: Colors.white,
          ),
          label: 'Leaderboard',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.forum_outlined,
            color: Colors.white,
          ),
          selectedIcon: Icon(
            Icons.forum,
            color: Colors.white,
          ),
          label: 'Forum',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.settings_outlined,
            color: Colors.white,
          ),
          selectedIcon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
