import 'package:flutter/material.dart';
import 'package:status/models/user.dart';

class UserService with ChangeNotifier {
  User _user;

  User get user => this._user;
  bool get userExists => this._user != null;

  set user(User user) {
    this._user = user;
    notifyListeners();
  }

  set age(int age) {
    this._user.age = age;
    notifyListeners();
  }

  void removeUser() {
    this._user = null;
    notifyListeners();
  }

  void addProfession(String profession) {
    this._user.professions.add(profession);
    notifyListeners();
  }
}
