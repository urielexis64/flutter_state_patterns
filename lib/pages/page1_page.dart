import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:status/bloc/user/user_bloc.dart';
import 'package:status/models/user.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page 1'),
          actions: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  context.read<UserBloc>().add(DeleteUser());
                })
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (_, state) {
            if (state.userExists) return UserInfo(state.user);
            return Center(
              child: Text('There is no user'),
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
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
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
              .map((profession) => ListTile(title: Text(profession)))
              .toList()
        ],
      ),
    );
  }
}
