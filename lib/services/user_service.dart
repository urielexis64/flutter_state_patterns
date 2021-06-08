import 'dart:async';

import 'package:status/models/user.dart';

class _UserService {
  User _user;

  StreamController<User> _userStreamController =
      new StreamController<User>.broadcast();

  User get user => this._user;
  bool get userExists => this._user != null;

  Stream<User> get userStream => _userStreamController.stream;

  set user(User newUser) {
    this._user = newUser;
    this._userStreamController.add(newUser);
  }

  void changeAge(int age) {
    this._user.age = age;
    this._userStreamController.add(this._user);
  }

  void closeStream() {
    this._userStreamController?.close();
  }
}

final userService = new _UserService();
