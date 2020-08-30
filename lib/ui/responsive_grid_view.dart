import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;

  ResponsiveGridView({this.items, this.itemBuilder});

  Widget build(context) {
    var screenSize = MediaQuery.of(context).size;
    var crossCount = 3;
    var deviceOrientation = MediaQuery.of(context).orientation;

    if (deviceOrientation == Orientation.landscape) crossCount = 4;

    crossCount = (screenSize.width / 160).floor();
    print(crossCount);
    print(screenSize.width);

    return GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7,
        crossAxisCount: crossCount,
      ),
      itemBuilder: (context, index) {
        return itemBuilder(items[index]);
      },
    );
  }
}
