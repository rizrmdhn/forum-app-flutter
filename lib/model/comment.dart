import 'package:forum_app_flutter/model/user.dart';

class Comment {
  String id;
  String body;
  String createdAt;
  Object owner;
  List<User> upVotesBy;
  List<User> downVotesBy;

  Comment({
    required this.id,
    required this.body,
    required this.createdAt,
    required this.owner,
    required this.upVotesBy,
    required this.downVotesBy,
  });
}
