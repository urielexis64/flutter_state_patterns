import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/pages/page1_page.dart';
import 'package:status/pages/page2_page.dart';
import 'package:status/services/user_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserService(),
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'page1',
        routes: {
          'page1': (_) => Page1Page(),
          'page2': (_) => Page2Page(),
        },
      ),
    );
  }
}
