import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/comment.dart';
import 'package:forum_app_flutter/model/thread.dart';
import 'package:forum_app_flutter/model/user.dart';
import 'package:forum_app_flutter/screen/detail_thread_screen.dart';

class ThreadCard extends StatelessWidget {
  final Thread thread;
  final String category;
  final String title;
  final String body;
  final List<User> upVotesBy;
  final List<User> downVotesBy;
  final List<Comment> comments;
  final String createdAt;
  final User owner;
  final bool isLiked;
  final bool isDisliked;
  final Function() onLikeThread;
  final Function() onDislikeThread;
  final User authUser;
  final double width;
  final double height;

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
    required this.isLiked,
    required this.isDisliked,
    required this.onLikeThread,
    required this.onDislikeThread,
    required this.authUser,
    required this.width,
    required this.height,
  }) : super(key: key);

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
                  '#$category',
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
                width: width >= 1000 ? width * 0.30 : width * 0.80,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailThreadScreen(
                            thread: thread,
                            authUser: authUser,
                            isLiked: isLiked,
                            isDisliked: isDisliked,
                            onLikeThread: onLikeThread,
                            onDislikeThread: onDislikeThread,
                            width: width,
                            height: height,
                          );
                        },
                      ),
                    );
                  },
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: width >= 1000 ? width * 0.30 : width * 0.80,
                margin: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 5, right: 5),
                child: Text(
                  body,
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
                onTap: onLikeThread,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: Icon(
                          isLiked
                              ? Icons.thumb_up_alt
                              : Icons.thumb_up_alt_outlined,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        upVotesBy.length.toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: onDislikeThread,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: Icon(
                          isDisliked
                              ? Icons.thumb_down_alt
                              : Icons.thumb_down_alt_outlined,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        downVotesBy.length.toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
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
                        comments.length.toString(),
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
