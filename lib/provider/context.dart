import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/leaderboard.dart';
import 'package:forum_app_flutter/model/myuser.dart';
import 'package:forum_app_flutter/model/thread.dart';

class ContextModel extends ChangeNotifier {
  final ThreadModel _threadModel = ThreadModel();
  ThreadModel get threadModel => _threadModel;

  final LeaderboardModel _leaderboardModel = LeaderboardModel();
  LeaderboardModel get leaderboardModel => _leaderboardModel;

  final AuthUserModel _authUserModel = AuthUserModel();
  AuthUserModel get authUserModel => _authUserModel;

  // thread actions
  bool isLiked(String threadId) {
    return _threadModel.threads.where((element) => element.id == threadId).any(
        (thread) =>
            thread.upVotesBy.any((u) => u.id == _authUserModel.authUser.id));
  }

  bool isDisliked(String threadId) {
    return _threadModel.threads.where((element) => element.id == threadId).any(
        (thread) =>
            thread.downVotesBy.any((u) => u.id == _authUserModel.authUser.id));
  }

  void likeThread(String threadId) {
    final threadIndex =
        _threadModel.threads.indexWhere((thread) => thread.id == threadId);
    final thread = _threadModel.threads[threadIndex];
    final userIndex =
        thread.upVotesBy.indexWhere((u) => u.id == _authUserModel.authUser.id);

    final isDisliked =
        thread.downVotesBy.any((u) => u.id == _authUserModel.authUser.id);

    if (userIndex == -1) {
      thread.upVotesBy.add(_authUserModel.authUser);
      if (isDisliked) {
        thread.downVotesBy.remove(_authUserModel.authUser);
      }
      notifyListeners();
    } else {
      thread.upVotesBy.removeAt(userIndex);
      notifyListeners();
    }
  }

  void disLikeThread(String threadId) {
    final threadIndex =
        _threadModel.threads.indexWhere((thread) => thread.id == threadId);
    final thread = _threadModel.threads[threadIndex];
    final userIndex = thread.downVotesBy
        .indexWhere((u) => u.id == _authUserModel.authUser.id);

    final isLiked =
        thread.upVotesBy.any((u) => u.id == _authUserModel.authUser.id);

    if (userIndex == -1) {
      thread.downVotesBy.add(_authUserModel.authUser);
      if (isLiked) {
        thread.upVotesBy.remove(_authUserModel.authUser);
      }
      notifyListeners();
    } else {
      thread.downVotesBy.removeAt(userIndex);
      notifyListeners();
    }
  }
}
