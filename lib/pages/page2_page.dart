import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:status/models/user.dart';
import 'package:status/bloc/user/user_bloc.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = context.watch<UserBloc>();

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
                  final newUser =
                      User(name: 'Uriel', age: 21, professions: ['Developer']);
                  userBloc.add(ActivateUser(newUser));
                }),
            MaterialButton(
                child:
                    Text('Change age', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  userBloc.add(ChangeAge(userBloc.state.user.age + 1));
                }),
            MaterialButton(
                child: Text('Add profession',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  userBloc.add(AddProfession('New Profession'));
                }),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_rounded),
        ));
  }
}
