import 'package:forum_app_flutter/model/user.dart';

class LeaderBoard {
  User user;
  int score;

  LeaderBoard({
    required this.user,
    required this.score,
  });
}

var leaderBoardList = [
  LeaderBoard(
    user: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
    score: 100,
  ),
  LeaderBoard(
    user: User(id: 'user-2', name: 'Jane Doe', email: 'janedoe@mail.com'),
    score: 90,
  ),
  LeaderBoard(
    user: User(id: 'user-3', name: 'John Smith', email: 'johnsmith@mail.com'),
    score: 80,
  ),
  LeaderBoard(
    user: User(id: 'user-4', name: 'Jane Smith', email: 'janesmith@mail.com'),
    score: 70,
  ),
];
