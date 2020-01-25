import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<String> items = ['Harry Potter', 'Riyria', 'Bible'];

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 10, 0),
              child: Text(
                'On Deck',
                style: Theme.of(context).textTheme.title,
              )),
          SizedBox(
              height: 100.0,
              child: ListView.builder(
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
