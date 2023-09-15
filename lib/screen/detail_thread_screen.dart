import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/app_bar.dart';
import 'package:forum_app_flutter/components/comment_card.dart';
import 'package:forum_app_flutter/model/comment.dart';
import 'package:forum_app_flutter/model/thread.dart';
import 'package:forum_app_flutter/model/user.dart';
import 'package:forum_app_flutter/provider/context.dart';
import 'package:forum_app_flutter/utils/date_formatter.dart';
import 'package:provider/provider.dart';

class DetailThreadScreen extends StatelessWidget {
  final Thread thread;
  final User authUser;
  final bool isLiked;
  final bool isDisliked;
  final Function() onLikeThread;
  final Function() onDislikeThread;
  final double width;
  final double height;

  const DetailThreadScreen({
    Key? key,
    required this.thread,
    required this.authUser,
    required this.isLiked,
    required this.isDisliked,
    required this.onLikeThread,
    required this.onDislikeThread,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContextModel>(
      builder: (context, value, child) => Scaffold(
        appBar: CustomAppBar(title: thread.title),
        body: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 5,
                      left: width >= 1000 ? width * 0.30 : width * 0.08,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      '#${thread.category}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: width >= 1000 ? width * 0.30 : width * 0.08,
                    ),
                    width: width >= 1000 ? width * 0.30 : width * 0.80,
                    height: 100,
                    child: Text(
                      thread.body,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: width >= 1000 ? width * 0.30 : width * 0.08,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 5, bottom: 10, right: 10),
                              child: InkWell(
                                onTap: () {
                                  final threadAction =
                                      context.read<ContextModel>();

                                  threadAction.likeThread(thread.id);
                                },
                                child: Icon(
                                  context
                                          .read<ContextModel>()
                                          .isLiked(thread.id)
                                      ? Icons.thumb_up_alt
                                      : Icons.thumb_up_alt_outlined,
                                ),
                              ),
                            ),
                            Text(
                              '${thread.upVotesBy.length}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 5, bottom: 10, left: 30, right: 10),
                              child: InkWell(
                                onTap: () {
                                  final threadAction =
                                      context.read<ContextModel>();

                                  threadAction.disLikeThread(thread.id);
                                },
                                child: Icon(context
                                        .read<ContextModel>()
                                        .isDisliked(thread.id)
                                    ? Icons.thumb_down_alt
                                    : Icons.thumb_down_alt_outlined),
                              ),
                            ),
                            Text(
                              '${thread.downVotesBy.length}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 5, bottom: 10, left: 30, right: 10),
                              child: InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.comment,
                                ),
                              ),
                            ),
                            Text(
                              '${thread.comments.length}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: width >= 1000 ? width * 0.30 : width * 0.08,
                            ),
                            width: width >= 1000 ? width * 0.30 : width * 0.62,
                            child: Text(
                              DateFormatter.format(
                                DateTime.parse(thread.createdAt),
                              ),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              ' ${thread.owner.name}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: width >= 1000 ? width * 0.30 : width * 0.08,
                    ),
                    width: width >= 1000 ? width * 0.35 : width * 0.80,
                    height: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 5,
                      left: width >= 1000 ? width * 0.30 : width * 0.08,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Komentar',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' (${thread.comments.length})',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: width >= 1000 ? width * 0.30 : width * 0.08,
                    ),
                    width: width >= 1000 ? width * 0.35 : width * 0.80,
                    height: height >= 600 ? height * 0.3 : height * 0.30,
                    child: CommentList(
                      comment: thread.comments,
                      threadId: thread.id,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentList extends StatelessWidget {
  final List<Comment> comment;
  final String threadId;

  const CommentList({
    Key? key,
    required this.comment,
    required this.threadId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comment.length,
      itemBuilder: (context, index) {
        return CommentCard(
          id: comment[index].id,
          body: comment[index].body,
          createdAt: comment[index].createdAt,
          owner: comment[index].owner,
          upVotesBy: comment[index].upVotesBy,
          downVotesBy: comment[index].downVotesBy,
          isCommentLiked: context
              .read<ContextModel>()
              .isCommentLiked(threadId, comment[index].id),
          isCommentDisliked: context.read<ContextModel>().isCommentDisliked(
                threadId,
                comment[index].id,
              ),
          onLike: () {
            final threadAction = context.read<ContextModel>();

            threadAction.likeComment(
              threadId,
              comment[index].id,
            );
          },
          onDislike: () {
            final threadAction = context.read<ContextModel>();

            threadAction.disLikeComment(
              threadId,
              comment[index].id,
            );
          },
        );
      },
    );
  }
}
