import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/thread_card.dart';
import 'package:forum_app_flutter/model/thread.dart';
import 'package:forum_app_flutter/model/user.dart';

class ThreadList extends StatefulWidget {
  final List<Thread> thread;
  final User authUser;

  const ThreadList({Key? key, required this.thread, required this.authUser})
      : super(key: key);

  @override
  ThreadListState createState() => ThreadListState();
}

class ThreadListState extends State<ThreadList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.thread.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(15, 255, 255, 255),
          ),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: ThreadCard(
            thread: widget.thread[index],
            category: widget.thread[index].category,
            title: widget.thread[index].title,
            body: widget.thread[index].body,
            upVotesBy: widget.thread[index].upVotesBy,
            downVotesBy: widget.thread[index].downVotesBy,
            comments: widget.thread[index].comments,
            createdAt: widget.thread[index].createdAt,
            owner: widget.thread[index].owner,
            isLiked: widget.thread[index].upVotesBy
                .any((user) => user.id == widget.authUser.id),
            isDisliked: widget.thread[index].downVotesBy
                .any((user) => user.id == widget.authUser.id),
            onLikeThread: () {
              setState(() {
                int authUserIndex = widget.thread[index].downVotesBy
                    .indexWhere((user) => user.id == widget.authUser.id);
                int isAlreadyLiked = widget.thread[index].upVotesBy
                    .indexWhere((user) => user.id == widget.authUser.id);

                if (authUserIndex != -1) {
                  widget.thread[index].downVotesBy.removeAt(authUserIndex);
                }

                if (isAlreadyLiked > 0 || isAlreadyLiked == 0) {
                  widget.thread[index].upVotesBy.removeAt(isAlreadyLiked);
                } else {
                  widget.thread[index].upVotesBy.add(widget.authUser);
                }
              });
            },
            onDislikeThread: () {
              setState(() {
                int authUserIndex = widget.thread[index].upVotesBy
                    .indexWhere((user) => user.id == widget.authUser.id);
                int isAlreadyDisliked = widget.thread[index].downVotesBy
                    .indexWhere((user) => user.id == widget.authUser.id);

                if (authUserIndex != -1) {
                  widget.thread[index].upVotesBy.removeAt(authUserIndex);
                }

                if (isAlreadyDisliked > 0 || isAlreadyDisliked == 0) {
                  widget.thread[index].downVotesBy.removeAt(isAlreadyDisliked);
                } else {
                  widget.thread[index].downVotesBy.add(widget.authUser);
                }
              });
            },
          ),
        );
      },
    );
  }
}
