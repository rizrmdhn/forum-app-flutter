import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? center;
  final List<Widget>? actions;
  final List<String>? options;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.center,
    this.options,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    if (center == true) {
      return AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 40, 49),
        title: Center(
          child: Text(title),
        ),
        actions: actions,
      );
    }
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 34, 40, 49),
      title: Text(title),
      actions: actions,
    );
  }
}
