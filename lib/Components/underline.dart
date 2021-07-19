import 'package:flutter/material.dart';

enum Slot {
  Text,
  Line
}

underline ({required List<Widget> children}) {
  return CustomMultiChildLayout(
    delegate: UnderlineDelegate(),
    children: children,
  );
}

class UnderlineDelegate extends MultiChildLayoutDelegate {

  // @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return super.getSize(constraints);
  }

  @override
  void performLayout(Size size) {
    Size sizeText = Size(0, 0);
    print('Custom layout initial size: $size');
    if (hasChild(Slot.Text)) {
      sizeText = layoutChild(Slot.Text, BoxConstraints.loose(size));
      positionChild(Slot.Text, Offset(0, 0));
    }
    if (hasChild(Slot.Line)) {
      final sizeLine = layoutChild(Slot.Line, BoxConstraints.tight(Size(size.width, size.height - sizeText.height)));
      positionChild(Slot.Line, Offset(0, sizeText.height));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    // throw UnimplementedError();
    return true;
  }

}