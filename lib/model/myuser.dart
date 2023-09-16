import 'package:flutter/material.dart';
import 'package:forum_app_flutter/model/user.dart';

class AuthUserModel extends ChangeNotifier {
  final User _authUser = myUser;
  User get authUser => _authUser;
}

var myUser = User(id: 'user-10', name: 'Rizki', email: "aze@mail.com");
