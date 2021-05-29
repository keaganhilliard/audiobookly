import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ResponsiveGridView<T> extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  final List<T>? items;
  final Widget Function(T item)? itemBuilder;

  ResponsiveGridView({this.items, this.itemBuilder});

  Widget build(context) {
    var screenSize = MediaQuery.of(context).size;
    var crossCount = 3;
    var deviceOrientation = MediaQuery.of(context).orientation;

    if (deviceOrientation == Orientation.landscape) crossCount = 4;

    crossCount =
        max((screenSize.width / 160).floor(), 3); // Always at least 3 columns
    print(crossCount);
    print(screenSize.width);

    return Scrollbar(
      radius: Radius.circular(5.0),
      controller: _controller,
      child: GridView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        key: PageStorageKey('responsive-grid'),
        controller: _controller,
        itemCount: items!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: crossCount,
        ),
        itemBuilder: (context, index) {
          return itemBuilder!(items![index]);
        },
      ),
    );
  }
}
