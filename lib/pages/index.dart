import 'package:flutter/cupertino.dart';
import 'package:flutter_hands_on/Components/my-scroll-view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final navigatonBarText = {0: 'Home', 1: 'Explore'};
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
              icon: Icon(CupertinoIcons.archivebox_fill), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.eye_solid), label: 'Explore')
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(builder: (context) {
          if (i == 0) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('${navigatonBarText[i]}'),
              ),
              child: MyScrollView()
            );
          } else {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('${navigatonBarText[i]}'),
              ),
              child: Center(
                child: Text('Hello cupertino! Page $i',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navLargeTitleTextStyle),
              ),
            );
          }
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