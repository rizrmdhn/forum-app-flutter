import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/thread_card.dart';
import 'package:forum_app_flutter/model/thread.dart';
import 'package:forum_app_flutter/model/user.dart';
import 'package:forum_app_flutter/provider/context.dart';
import 'package:provider/provider.dart';

class ThreadList extends StatefulWidget {
  final List<Thread> thread;
  final User authUser;

  const ThreadList({
    Key? key,
    required this.thread,
    required this.authUser,
  }) : super(key: key);

  @override
  ThreadListState createState() => ThreadListState();
}

class ThreadListState extends State<ThreadList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContextModel>(
      builder: (context, value, child) => ListView.builder(
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
              isLiked: context.read<ContextModel>().isLiked(
                    widget.thread[index].id,
                  ),
              isDisliked: context
                  .read<ContextModel>()
                  .isDisliked(widget.thread[index].id),
              onLikeThread: () {
                final threadAction = context.read<ContextModel>();

                threadAction.likeThread(widget.thread[index].id);
              },
              onDislikeThread: () {
                final threadAction = context.read<ContextModel>();

                threadAction.disLikeThread(widget.thread[index].id);
              },
              authUser: widget.authUser,
            ),
          );
        },
      ),
    );
  }
}
