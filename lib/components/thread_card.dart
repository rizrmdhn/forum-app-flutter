import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/comment.dart';
import 'package:forum_app_flutter/model/thread.dart';
import 'package:forum_app_flutter/model/user.dart';
import 'package:forum_app_flutter/screen/detail_thread_screen.dart';

class ThreadCard extends StatefulWidget {
  final Thread thread;
  final String category;
  final String title;
  final String body;
  final List<User> upVotesBy;
  final List<User> downVotesBy;
  final List<Comment> comments;
  final String createdAt;
  final User owner;

  const ThreadCard({
    Key? key,
    required this.thread,
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color(0x00222831),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 5, right: 5),
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 34, 40, 49),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
                child: Text(
                  '#${widget.category}',
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                    left: 10, top: 0, bottom: 5, right: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailThreadScreen(thread: widget.thread);
                        },
                      ),
                    );
                  },
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 5, right: 5),
                child: Text(
                  widget.body,
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: const Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        widget.upVotesBy.length.toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: const Icon(
                          Icons.thumb_down_alt_outlined,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        widget.downVotesBy.length.toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: const Icon(
                          Icons.comment,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        widget.comments.length.toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
