import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentPageIndex;
  final Function(int) changePage;

  const CustomBottomNavigation({
    Key? key,
    required this.currentPageIndex,
    required this.changePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: changePage,
      selectedIndex: currentPageIndex,
      backgroundColor: const Color.fromARGB(255, 34, 40, 49),
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
      ],
    );
  }
}
