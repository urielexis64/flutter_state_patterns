import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:status/pages/page1_page.dart';
import 'package:status/pages/page2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      getPages: [
        GetPage(name: 'page1', page: () => Page1Page()),
        GetPage(name: 'page2', page: () => Page2Page()),
      ],
    );
  }
}
