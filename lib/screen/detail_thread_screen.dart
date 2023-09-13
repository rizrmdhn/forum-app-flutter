import 'package:flutter/material.dart';
import 'package:forum_app_flutter/components/app_bar.dart';
import 'package:forum_app_flutter/components/comment_card.dart';
import 'package:forum_app_flutter/model/comment.dart';
import 'package:forum_app_flutter/model/thread.dart';
import 'package:forum_app_flutter/utils/date_formatter.dart';

class DetailThreadScreen extends StatefulWidget {
  final Thread thread;
  const DetailThreadScreen({Key? key, required this.thread}) : super(key: key);

  @override
  DetailThreadScreenState createState() => DetailThreadScreenState();
}

class DetailThreadScreenState extends State<DetailThreadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.thread.title),
      body: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 5, left: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    '#${widget.thread.category}',
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
                  margin: const EdgeInsets.only(top: 5, bottom: 5, left: 30),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 100,
                  child: Text(
                    widget.thread.body,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
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
                              Icons.thumb_up_alt_outlined,
                            ),
                          ),
                        ),
                        Text(
                          '${widget.thread.upVotesBy.length}',
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
                              Icons.thumb_down_alt_outlined,
                            ),
                          ),
                        ),
                        Text(
                          '${widget.thread.downVotesBy.length}',
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
                          '${widget.thread.comments.length}',
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
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 30),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            DateFormatter.format(
                              DateTime.parse(widget.thread.createdAt),
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
                            ' ${widget.thread.owner.name}',
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
                  margin: const EdgeInsets.only(top: 5, bottom: 5, left: 30),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 5, left: 30),
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
                        ' (${widget.thread.comments.length})',
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
                  margin: const EdgeInsets.only(top: 5, bottom: 5, left: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: CommentList(comment: widget.thread.comments),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CommentList extends StatefulWidget {
  final List<Comment> comment;
  const CommentList({Key? key, required this.comment}) : super(key: key);

  @override
  CommentListState createState() => CommentListState();
}

class CommentListState extends State<CommentList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.comment.length,
      itemBuilder: (context, index) {
        return CommentCard(
          id: widget.comment[index].id,
          body: widget.comment[index].body,
          createdAt: widget.comment[index].createdAt,
          owner: widget.comment[index].owner,
          upVotesBy: widget.comment[index].upVotesBy,
          downVotesBy: widget.comment[index].downVotesBy,
        );
      },
    );
  }
}
