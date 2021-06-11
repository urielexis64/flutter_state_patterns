import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:status/bloc/user/user_cubit.dart';
import 'package:status/models/user.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCubit = context.watch<UserCubit>();

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
                      User(age: 21, name: "Uriel", professions: ["Systems"]);
                  userCubit.setUser(newUser);
                }),
            MaterialButton(
                child:
                    Text('Change age', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  userCubit.changeAge(22);
                }),
            MaterialButton(
                child: Text('Add profession',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  userCubit.addProfession("Engineer");
                }),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_rounded),
        ));
  }
}
