import 'package:meta/meta.dart';

class User {
  String name;
  int age;
  List<String> professions;
  User({
    @required this.name,
    this.age,
    this.professions,
  }) : assert(name != null);
}
