import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/user.dart';
import 'package:forum_app_flutter/utils/date_formatter.dart';

class CommentCard extends StatelessWidget {
  final String id;
  final String body;
  final String createdAt;
  final User owner;
  final List<User> upVotesBy;
  final List<User> downVotesBy;
  final bool isCommentLiked;
  final bool isCommentDisliked;
  final Function() onLike;
  final Function() onDislike;

  const CommentCard({
    Key? key,
    required this.id,
    required this.body,
    required this.createdAt,
    required this.owner,
    required this.upVotesBy,
    required this.downVotesBy,
    required this.isCommentLiked,
    required this.isCommentDisliked,
    required this.onLike,
    required this.onDislike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://ui-avatars.com/api/?name=${owner.name}&length=1&background=random&size=128',
                          width: 28,
                        ),
                      ),
                    ),
                    Text(
                      owner.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  DateFormatter.format(
                    DateTime.parse(createdAt),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                body,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            onLike();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              isCommentLiked
                                  ? Icons.thumb_up_alt
                                  : Icons.thumb_up_alt_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          '${upVotesBy.length}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            onDislike();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              isCommentDisliked
                                  ? Icons.thumb_down_alt
                                  : Icons.thumb_down_alt_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          '${downVotesBy.length}',
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
            ],
          ),
        ),
      ],
    );
  }
}
