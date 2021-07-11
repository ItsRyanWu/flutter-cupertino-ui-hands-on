import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static const a = ConstantInstance([1], {'test': 1}, '');

  void _incrementCounter() {
    print(a);
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.folder_fill), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.eye_solid), label: 'Explore')
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(
            child: Center(
              child: Text('Hello cupertino!',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navLargeTitleTextStyle),
            ),
          );
        });
      },
    );
  }
}

class ConstantInstance {
  final List<int> collection;
  final Map<String, dynamic> object;
  final String string;

  const ConstantInstance(this.collection, this.object, this.string);
}
