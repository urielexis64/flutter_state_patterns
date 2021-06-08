import 'package:flutter/material.dart';
import 'package:status/models/user.dart';
import 'package:status/services/user_service.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: userService.userStream,
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              return Text(snapshot.hasData ? snapshot.data.name : 'Page 2');
            },
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                userService.user = new User(
                    age: 21, name: 'Uriel', professions: ['Systems Engineer']);
              },
              color: Colors.blueAccent,
              child: Text('Set user', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              onPressed: () {
                userService.changeAge(22);
              },
              color: Colors.blueAccent,
              child: Text('Change age', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.blueAccent,
              child: Text('Add profession ',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_rounded),
        ));
  }
}
