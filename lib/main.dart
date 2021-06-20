import 'package:flutter/material.dart';
import 'package:status/pages/page1_page.dart';
import 'package:status/pages/page2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      routes: {
        'page1': (_) => Page1Page(),
        'page2': (_) => Page2Page(),
      },
    );
  }
}
