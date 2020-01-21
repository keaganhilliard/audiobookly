import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<String> items = ['Harry Potter', 'Riyria', 'Bible'];

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Padding(padding: EdgeInsets.all(10), child:Text('On Deck')),
      SizedBox(height: 100.0, child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: 150.0,
            child: ListTile(
            subtitle: Text('Author'),
            title: Text('${items[index]}'),
          ));
        },
      ))
    ]);
  }
}
