import 'package:flutter/material.dart';

class Authors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 44,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(padding: EdgeInsets.all(10), child: Text('Some shit')),
        );
      },
    );
  }
}