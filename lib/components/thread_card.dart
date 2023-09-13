import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/user.dart';

class ThreadCard extends StatefulWidget {
  final String category;
  final String title;
  final String body;
  final Object upVotesBy;
  final Object downVotesBy;
  final Object comments;
  final String createdAt;
  final User owner;

  const ThreadCard({
    Key? key,
    required this.category,
    required this.title,
    required this.body,
    required this.upVotesBy,
    required this.downVotesBy,
    required this.comments,
    required this.createdAt,
    required this.owner,
  }) : super(key: key);

  @override
  ThreadCardState createState() => ThreadCardState();
}

class ThreadCardState extends State<ThreadCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            subtitle: Text(widget.body),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('Upvote'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Downvote'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Comment'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
