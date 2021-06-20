import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status/controllers/user_controller.dart';
import 'package:status/models/user.dart';
import 'package:status/pages/page2_page.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.put(UserController());

    return Scaffold(
        appBar: AppBar(
          title: Text('Page 1'),
        ),
        body: Obx(() => userCtrl.userExists.value
            ? UserInfo(user: userCtrl.user.value)
            : NoInfo()),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(
            'page2',
          ),
          child: Icon(Icons.arrow_forward_rounded),
        ));
  }
}

class NoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('there is no user.'),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('General',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            ListTile(title: Text('Name: ${this.user.name}')),
            ListTile(title: Text('Age: ${this.user.age}')),
            Text('Professions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            ...this
                .user
                .professions
                .map((profession) => ListTile(title: Text(profession)))
          ],
        ),
      ),
    );
  }
}
