import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/app_bar.dart';
import 'package:forum_app_flutter/components/thread_list.dart';
import 'package:forum_app_flutter/model/thread.dart';
import 'package:forum_app_flutter/model/user.dart';

class ForumScreen extends StatefulWidget {
  final List<Thread> thread;
  final User authUser;

  const ForumScreen({Key? key, required this.thread, required this.authUser})
      : super(key: key);

  @override
  ForumScreenState createState() => ForumScreenState();
}

class ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Forum'),
      body: Center(
        child: ThreadList(thread: widget.thread, authUser: widget.authUser),
      ),
    );
  }
}
