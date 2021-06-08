import 'package:flutter/material.dart';
import 'package:status/models/user.dart';

class UserService with ChangeNotifier {
  User _user;

  User get user => this._user;
  bool get userExists => this._user != null;
}
