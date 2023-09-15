import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/leaderboard.dart';
import 'package:forum_app_flutter/model/thread.dart';

class ContextModel extends ChangeNotifier {
  final ThreadModel threadModel = ThreadModel();
  LeaderboardModel leaderboardModel = LeaderboardModel();
}
