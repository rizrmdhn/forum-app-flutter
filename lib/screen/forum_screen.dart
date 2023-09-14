import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/app_bar.dart';
import 'package:forum_app_flutter/components/thread_list.dart';
import 'package:forum_app_flutter/model/user.dart';
import 'package:forum_app_flutter/provider/context.dart';
import 'package:provider/provider.dart';

class ForumScreen extends StatefulWidget {
  final User authUser;

  const ForumScreen({Key? key, required this.authUser}) : super(key: key);

  @override
  ForumScreenState createState() => ForumScreenState();
}

class ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContextModel>(
      builder: (context, value, child) => Scaffold(
        appBar: const CustomAppBar(title: 'Forum'),
        body: Center(
          child: ThreadList(
            thread: value.threadModel.threads,
            authUser: widget.authUser,
          ),
        ),
      ),
    );
  }
}
