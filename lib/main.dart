import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      theme: CupertinoThemeData(
          barBackgroundColor: CupertinoColors.white,
          textTheme: CupertinoTextThemeData(
              navLargeTitleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                  color: CupertinoColors.activeBlue))),
    );
  }
}

