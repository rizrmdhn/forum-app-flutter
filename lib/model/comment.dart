class Comment {
  String id;
  String body;
  String createdAt;
  String ownerId;
  List<Object> upVotesBy;
  List<Object> downVotesBy;

  Comment({
    required this.id,
    required this.body,
    required this.createdAt,
    required this.ownerId,
    required this.upVotesBy,
    required this.downVotesBy,
  });
}
