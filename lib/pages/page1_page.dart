import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/models/user.dart';
import 'package:status/services/user_service.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = context.watch<UserService>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Page 1'),
          actions: [
            IconButton(
                icon: Icon(Icons.delete),
                disabledColor: Colors.white30,
                onPressed: userService.user != null
                    ? () => userService.removeUser()
                    : null)
          ],
        ),
        body: userService.userExists
            ? UserInfo(user: userService.user)
            : Center(child: Text('There is no user')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'page2'),
          child: Icon(Icons.arrow_forward_rounded),
        ));
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('General',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            ListTile(title: Text('Name: ${user.name}')),
            ListTile(title: Text('Age: ${user.age}')),
            Text('Professions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            ...user.professions
                .map((profession) =>
                    ListTile(title: Text('Profession: $profession')))
                .toList()
          ],
        ),
      ),
    );
  }
}
