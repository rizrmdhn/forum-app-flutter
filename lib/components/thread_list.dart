import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/thread_card.dart';
import 'package:forum_app_flutter/model/thread.dart';
import 'package:forum_app_flutter/model/user.dart';
import 'package:forum_app_flutter/provider/context.dart';
import 'package:provider/provider.dart';

class ThreadList extends StatelessWidget {
  final List<Thread> thread;
  final User authUser;
  final double width;
  final double height;

  const ThreadList({
    Key? key,
    required this.thread,
    required this.authUser,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContextModel>(
      builder: (context, value, child) => ListView.builder(
        itemCount: thread.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(15, 255, 255, 255),
            ),
            margin: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: width >= 1000 ? width * 0.30 : width * 0.05,
            ),
            child: ThreadCard(
              thread: thread[index],
              category: thread[index].category,
              title: thread[index].title,
              body: thread[index].body,
              upVotesBy: thread[index].upVotesBy,
              downVotesBy: thread[index].downVotesBy,
              comments: thread[index].comments,
              createdAt: thread[index].createdAt,
              owner: thread[index].owner,
              isLiked: context.read<ContextModel>().isLiked(
                    thread[index].id,
                  ),
              isDisliked:
                  context.read<ContextModel>().isDisliked(thread[index].id),
              onLikeThread: () {
                final threadAction = context.read<ContextModel>();

                threadAction.likeThread(thread[index].id);
              },
              onDislikeThread: () {
                final threadAction = context.read<ContextModel>();

                threadAction.disLikeThread(thread[index].id);
              },
              authUser: authUser,
              width: width,
              height: height,
            ),
          );
        },
      ),
    );
  }
}
