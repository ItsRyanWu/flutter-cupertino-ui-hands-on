import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hands_on/Components/my-scroll-view.dart';
import 'package:flutter_hands_on/Components/underline.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final navigatonBarText = {0: 'List', 1: 'FLex', 2: 'Custom'};
  // static const a = ConstantInstance([1], {'test': 1}, '');

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.list_bullet), label: 'List'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.rectangle_fill), label: 'Flex'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.triangle_fill), label: 'Custom')
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
          } else if (i == 1) {
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
                      Expanded(
                        flex: 1,
                        child: LayoutBuilder(builder: (_, constraints) {
                          print(constraints);
                          return Container(
                            color: Colors.blue[50],
                            child: Center(
                              child: Container(
                                // width: 300,
                                // height: 300,
                                color: Colors.red[50],
                                constraints: BoxConstraints(
                                  maxHeight: 250,
                                  minHeight: 50,
                                  maxWidth: 250,
                                  minWidth: 50
                                ),
                                child: Stack(
                                  fit: StackFit.passthrough,
                                  alignment: Alignment.center,
                                  children: [
                                    // Positioned(
                                    //   right: 0,
                                    //   top: 0,
                                    //   child: 
                                      Container(
                                        width: 40,
                                        height: 40,
                                        color: Colors.yellow[50]
                                      ),
                                    // ),
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
          } else {
            return  CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('${navigatonBarText[i]}'),
              ),
              child: underline(
                children: [
                  LayoutId(
                    id: Slot.Text,
                    child: Container(
                      color: Colors.purple[50],
                      width: double.infinity,
                      height: 300
                    )
                  ),
                  LayoutId(id:
                    Slot.Line, 
                    child: Container(
                      color: Colors.orange[50],
                    )
                  )
                ]
              )
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
