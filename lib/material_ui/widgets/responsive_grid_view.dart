import 'package:flutter/material.dart';
import 'dart:math';

class ResponsiveGridView<T> extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  final List<T>? items;
  final Widget Function(T item)? itemBuilder;

  ResponsiveGridView({this.items, this.itemBuilder, Key? key})
      : super(key: key);

  @override
  Widget build(context) {
    var screenSize = MediaQuery.of(context).size;
    var crossCount = 3;
    var deviceOrientation = MediaQuery.of(context).orientation;

    if (deviceOrientation == Orientation.landscape) crossCount = 4;

    crossCount = max(
      min((screenSize.width / 200).floor(), 6),
      3,
    ); // Always at least 3 columns

    return Scrollbar(
      radius: const Radius.circular(5.0),
      controller: _controller,
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        key: const PageStorageKey('responsive-grid'),
        controller: _controller,
        itemCount: items!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: crossCount,
        ),
        itemBuilder: (context, index) {
          return itemBuilder!(items![index]);
        },
      ),
    );
  }
}
