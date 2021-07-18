import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hands_on/Components/my-scroll-view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final navigatonBarText = {0: 'Home', 1: 'Explore'};
  // static const a = ConstantInstance([1], {'test': 1}, '');

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
          if (i != 0) {
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
                child: Container(
                  color: Colors.green[50],
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hello cupertino! Page $i',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navLargeTitleTextStyle
                      ),
                      LayoutBuilder(builder: (_, constraints) {
                        print(constraints);
                        return Container(
                          child: Text('Text')
                        );
                      }),
                      Expanded(
                        flex: 1,
                        child: LayoutBuilder(builder: (_, constraints) {
                          print(constraints);
                          return Container(
                            color: Colors.blue[50],
                            child: Center(
                              child: Container(
                                width: 300,
                                height: 300,
                                color: Colors.red[50],
                                constraints: BoxConstraints(
                                  maxHeight: 250,
                                  maxWidth: 250
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        color: Colors.yellow[50]
                                      ),
                                    ),
                                    LayoutBuilder(builder: (_, constraints) {
                                      print('Stack constriants for children: $constraints');
                                      return Text('Flex area');
                                    })
                                  ],
                                )
                              )
                            )
                          );
                        })
                      )
                    ],
                  ),
                )
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
