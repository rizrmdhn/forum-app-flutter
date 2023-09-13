import 'package:forum_app_flutter/model/comment.dart';
import 'package:forum_app_flutter/model/user.dart';

class Thread {
  String id;
  String title;
  String body;
  String category;
  String createdAt;
  User owner;
  List<User> upVotesBy;
  List<User> downVotesBy;
  List<Comment> comments;
  int totalComments;

  Thread({
    required this.id,
    required this.title,
    required this.body,
    required this.category,
    required this.createdAt,
    required this.owner,
    required this.upVotesBy,
    required this.downVotesBy,
    required this.comments,
    required this.totalComments,
  });
}

var threadList = [
  Thread(
    id: 'thread-1',
    title: 'How to make a Flutter app?',
    body: 'I want to make a Flutter app, but I don\'t know how to start.',
    category: 'Flutter',
    createdAt: '2021-10-01T00:00:00.000Z',
    owner: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
    upVotesBy: [
      User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
      User(id: 'user-2', name: 'Jane Doe', email: 'janeDoe@mail.com'),
    ],
    downVotesBy: [],
    comments: List.generate(
      2,
      (index) => Comment(
        id: 'comment-$index',
        body: 'This is a comment',
        createdAt: '2021-10-01T00:00:00.000Z',
        owner: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
        upVotesBy: [
          User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
          User(id: 'user-2', name: 'Jane Doe', email: 'janedoe@mail.com'),
        ],
        downVotesBy: [],
      ),
    ),
    totalComments: 2,
  ),
  Thread(
    id: 'thread-2',
    title: 'How to make a React app?',
    body: 'I want to make a React app, but I don\'t know how to start.',
    category: 'React',
    createdAt: '2021-10-01T00:00:00.000Z',
    owner: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
    upVotesBy: [
      User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
      User(id: 'user-2', name: 'Jane Doe', email: 'janeDoe@mail.com'),
    ],
    downVotesBy: [
      User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
    ],
    comments: List.generate(
      2,
      (index) => Comment(
        id: 'comment-$index',
        body: 'This is a comment',
        createdAt: '2021-10-01T00:00:00.000Z',
        owner: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
        upVotesBy: [
          User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
          User(id: 'user-2', name: 'Jane Doe', email: 'janedoe@mail.com'),
        ],
        downVotesBy: [],
      ),
    ),
    totalComments: 2,
  ),
  Thread(
    id: 'thread-3',
    title: 'How to create a database?',
    body: 'I want to create a database, but I don\'t know how to start.',
    category: 'Database',
    createdAt: '2021-10-01T00:00:00.000Z',
    owner: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
    upVotesBy: [
      User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
      User(id: 'user-2', name: 'Jane Doe', email: 'janeDoe@mail.com'),
    ],
    downVotesBy: [],
    comments: List.generate(
      2,
      (index) => Comment(
        id: 'comment-$index',
        body: 'This is a comment',
        createdAt: '2021-10-01T00:00:00.000Z',
        owner: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
        upVotesBy: [
          User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
          User(id: 'user-2', name: 'Jane Doe', email: 'janeDoe@mail.com'),
        ],
        downVotesBy: [],
      ),
    ),
    totalComments: 2,
  ),
  Thread(
    id: 'thread-4',
    title: 'How to develop a mobile app?',
    body: 'I want to develop a mobile app, but I don\'t know how to start.',
    category: 'Mobile',
    createdAt: '2021-10-01T00:00:00.000Z',
    owner: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
    upVotesBy: [
      User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
      User(id: 'user-2', name: 'Jane Doe', email: 'janeDoe@mail.com'),
    ],
    downVotesBy: [],
    comments: List.generate(
      2,
      (index) => Comment(
        id: 'comment-$index',
        body: 'This is a comment',
        createdAt: '2021-10-01T00:00:00.000Z',
        owner: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
        upVotesBy: [
          User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
          User(id: 'user-2', name: 'Jane Doe', email: 'janedoe@mail.com'),
        ],
        downVotesBy: [],
      ),
    ),
    totalComments: 2,
  ),
  Thread(
    id: 'thread-5',
    title: 'How to make a multiplatform app',
    body: 'I want to make a multiplatform app, but I don\'t know how to start.',
    category: 'Multiplatform',
    createdAt: '2021-10-01T00:00:00.000Z',
    owner: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
    upVotesBy: [
      User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
      User(id: 'user-2', name: 'Jane Doe', email: 'janeDoe@mail.com'),
    ],
    downVotesBy: [],
    comments: List.generate(
      2,
      (index) => Comment(
        id: 'comment-$index',
        body: 'This is a comment',
        createdAt: '2021-10-01T00:00:00.000Z',
        owner: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
        upVotesBy: [
          User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
          User(id: 'user-2', name: 'Jane Doe', email: 'janeDoe@mail.com'),
        ],
        downVotesBy: [],
      ),
    ),
    totalComments: 2,
  ),
  Thread(
    id: 'thread-6',
    title: 'What is the best programming language?',
    body: 'I want to know what is the best programming language to learn.',
    category: 'General',
    createdAt: '2021-10-01T00:00:00.000Z',
    owner: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
    upVotesBy: [
      User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
      User(id: 'user-2', name: 'Jane Doe', email: 'janeDoe@mail.com'),
    ],
    downVotesBy: [],
    comments: List.generate(
      2,
      (index) => Comment(
        id: 'comment-$index',
        body: 'This is a comment',
        createdAt: '2021-10-01T00:00:00.000Z',
        owner: User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
        upVotesBy: [
          User(id: 'user-1', name: 'John Doe', email: 'johndoe@mail.com'),
          User(id: 'user-2', name: 'Jane Doe', email: 'janeDoe@mail.com'),
        ],
        downVotesBy: [],
      ),
    ),
    totalComments: 2,
  ),
];
