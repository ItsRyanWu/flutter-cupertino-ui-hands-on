import 'package:flutter/cupertino.dart';

class MyScrollView extends StatefulWidget {
  MyScrollView({Key? key}) : super(key: key);

  @override
  _MyScrollViewState createState() => _MyScrollViewState();
}

class _MyScrollViewState extends State<MyScrollView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: 200, // 元素个数
            itemExtent: 50, // 列表项高度
            itemBuilder: (BuildContext context, int index) =>
                Text("Item $index")
      )
    );
  }
}
