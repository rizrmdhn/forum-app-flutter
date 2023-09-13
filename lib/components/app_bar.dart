import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool? center;
  final List<Widget>? actions;
  final List<String>? options;

  const CustomAppBar(
      {Key? key, required this.title, this.center, this.options, this.actions})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    if (widget.center == true) {
      return AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 40, 49),
        title: Center(
          child: Text(widget.title),
        ),
        actions: widget.actions,
      );
    }
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 34, 40, 49),
      title: Text(widget.title),
      actions: widget.actions,
    );
  }
}
