import 'package:flutter/material.dart';

class ResponsiveGridView extends StatelessWidget {
  final List<Widget> children;

  ResponsiveGridView({this.children});

  Widget build(context) {
    return GridView.count(
      crossAxisCount:
          MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
      childAspectRatio: 0.745,
      padding: EdgeInsets.all(10.0),
      children: children,
    );
  }
}
