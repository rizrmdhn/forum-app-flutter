import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/comment.dart';
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

  void addThread(String title, String body, String category) {
    final newThread = Thread(
      id: DateTime.now().toString(),
      title: title,
      body: body,
      category: category,
      createdAt: DateTime.now().toString(),
      owner: _authUserModel.authUser,
      upVotesBy: [],
      downVotesBy: [],
      comments: [],
      totalComments: 0,
    );

    _threadModel.threads.add(newThread);
    notifyListeners();
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

  bool isCommentLiked(String threadId, String commentId) {
    final threadIndex =
        _threadModel.threads.indexWhere((thread) => thread.id == threadId);
    final thread = _threadModel.threads[threadIndex];
    final commentIndex =
        thread.comments.indexWhere((comment) => comment.id == commentId);
    final comment = thread.comments[commentIndex];
    return comment.upVotesBy.any((u) => u.id == _authUserModel.authUser.id);
  }

  bool isCommentDisliked(String threadId, String commentId) {
    final threadIndex =
        _threadModel.threads.indexWhere((thread) => thread.id == threadId);
    final thread = _threadModel.threads[threadIndex];
    final commentIndex =
        thread.comments.indexWhere((comment) => comment.id == commentId);
    final comment = thread.comments[commentIndex];
    return comment.downVotesBy.any((u) => u.id == _authUserModel.authUser.id);
  }

  void addComment(String threadId, String body) {
    final threadIndex =
        _threadModel.threads.indexWhere((thread) => thread.id == threadId);
    final thread = _threadModel.threads[threadIndex];

    final newComment = Comment(
      id: DateTime.now().toString(),
      body: body,
      createdAt: DateTime.now().toString(),
      owner: _authUserModel.authUser,
      upVotesBy: [],
      downVotesBy: [],
    );

    thread.comments.add(newComment);
    thread.totalComments += 1;
    notifyListeners();
  }

  void likeComment(String threadId, String commentId) {
    final threadIndex =
        _threadModel.threads.indexWhere((thread) => thread.id == threadId);
    final thread = _threadModel.threads[threadIndex];
    final commentIndex =
        thread.comments.indexWhere((comment) => comment.id == commentId);
    final comment = thread.comments[commentIndex];
    final userIndex =
        comment.upVotesBy.indexWhere((u) => u.id == _authUserModel.authUser.id);

    final isDisliked =
        comment.downVotesBy.any((u) => u.id == _authUserModel.authUser.id);

    if (userIndex == -1) {
      comment.upVotesBy.add(_authUserModel.authUser);
      if (isDisliked) {
        comment.downVotesBy.remove(_authUserModel.authUser);
      }
      notifyListeners();
    } else {
      comment.upVotesBy.removeAt(userIndex);
      notifyListeners();
    }
  }

  void disLikeComment(String threadId, String commentId) {
    final threadIndex =
        _threadModel.threads.indexWhere((thread) => thread.id == threadId);
    final thread = _threadModel.threads[threadIndex];
    final commentIndex =
        thread.comments.indexWhere((comment) => comment.id == commentId);
    final comment = thread.comments[commentIndex];
    final userIndex = comment.downVotesBy
        .indexWhere((u) => u.id == _authUserModel.authUser.id);

    final isLiked =
        comment.upVotesBy.any((u) => u.id == _authUserModel.authUser.id);

    if (userIndex == -1) {
      comment.downVotesBy.add(_authUserModel.authUser);
      if (isLiked) {
        comment.upVotesBy.remove(_authUserModel.authUser);
      }
      notifyListeners();
    } else {
      comment.downVotesBy.removeAt(userIndex);
      notifyListeners();
    }
  }
}
