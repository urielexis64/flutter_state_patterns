import 'package:flutter/material.dart';
import 'package:status/models/user.dart';
import 'package:status/services/user_service.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page 1'),
        ),
        body: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? UserInfo(snapshot.data)
                : Center(
                    child: Text('There is no user info.'),
                  );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'page2'),
          child: Icon(Icons.arrow_forward_rounded),
        ));
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  UserInfo(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(title: Text('Name: ${user.name}')),
          ListTile(title: Text('Age: ${user.age}')),
          Text(
            'Professions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...List.generate(
                  user.professions.length,
                  (index) => ListTile(
                      title: Text(
                          'Profession ${index + 1}: ${user.professions[index]}')))
              .toList()
        ],
      ),
    );
  }
}
