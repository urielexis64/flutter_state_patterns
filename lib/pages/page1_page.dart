import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/services/user_service.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = context.watch<UserService>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Page 1'),
        ),
        body: userService.userExists
            ? UserInfo()
            : Center(child: Text('There is no user')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'page2'),
          child: Icon(Icons.arrow_forward_rounded),
        ));
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Name: ')),
          ListTile(title: Text('Age: ')),
          Text('Professions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ...List.generate(1,
                  (index) => ListTile(title: Text('Profession ${index + 1}: ')))
              .toList()
        ],
      ),
    );
  }
}
