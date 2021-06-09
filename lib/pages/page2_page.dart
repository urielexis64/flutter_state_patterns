import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/models/user.dart';
import 'package:status/services/user_service.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = context.watch<UserService>();

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
                  userService.user =
                      User(name: "Uriel", age: 21, professions: ["Developer"]);
                }),
            MaterialButton(
                child:
                    Text('Change age', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                disabledColor: Colors.grey.withOpacity(.9),
                onPressed: userService.user != null
                    ? () => userService.age = userService.user.age + 1
                    : null),
            MaterialButton(
                child: Text('Add profession',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                disabledColor: Colors.grey.withOpacity(.9),
                onPressed: userService.user != null
                    ? () => userService.addProfession('Systems')
                    : null)
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_rounded),
        ));
  }
}
