import 'package:flutter/material.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {}),
            MaterialButton(
                child:
                    Text('Change age', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {}),
            MaterialButton(
                child: Text('Add profession',
                    style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {}),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_rounded),
        ));
  }
}
