import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/thread.dart';

class ForumScreen extends StatefulWidget {
  final List<Thread> thread;

  const ForumScreen({Key? key, required this.thread}) : super(key: key);

  @override
  ForumScreenState createState() => ForumScreenState();
}

class ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Forum'),
      ),
    );
  }
}
