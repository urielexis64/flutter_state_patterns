import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status/controllers/user_controller.dart';
import 'package:status/models/user.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Page 2'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: Text('Set User', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  userCtrl.loadUser(
                      User(name: 'Uriel', age: 21, professions: ['Developer']));
                  Get.snackbar('Mensaje', 'Usuario establecido exitosamente.',
                      backgroundColor: Colors.white.withOpacity(0.8),
                      boxShadows: [
                        BoxShadow(color: Colors.black38, blurRadius: 5)
                      ],
                      duration: Duration(milliseconds: 1500));
                }),
            MaterialButton(
                child:
                    Text('Change age', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  userCtrl.changeAge(23);
                }),
            MaterialButton(
                child: Text('Add profession',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  userCtrl
                      .addProfession('Profesión #${userCtrl.professionCount}');
                }),
            MaterialButton(
                child:
                    Text('Change Theme', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                }),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_rounded),
        ));
  }
}
