import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

class ResponsiveGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;

  ResponsiveGridView({this.items, this.itemBuilder});

  Widget build(context) {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 3
                  : 4),
      itemBuilder: (context, index) {
        return itemBuilder(items[index]);
      },
    );
    // return GridView.count(
    //   crossAxisCount:
    //       MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
    //   childAspectRatio: 0.745,
    //   padding: EdgeInsets.all(10.0),
    //   children: children,
    // );
  }
}
