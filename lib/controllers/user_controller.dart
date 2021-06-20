import 'package:get/get.dart';
import 'package:status/models/user.dart';

class UserController extends GetxController {
  var userExists = false.obs;
  var user = User().obs;

  int get professionCount => this.user.value.professions.length;

  void loadUser(User user) {
    this.userExists.value = true;
    this.user.value = user;
  }

  void changeAge(int age) {
    this.user.update((val) {
      val!.age = age;
    });
  }

  void addProfession(String profession) {
    this.user.update((val) {
      val!.professions = [...val.professions, profession];
    });
  }
}
