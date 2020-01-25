import 'package:flutter/material.dart';

class NowPlaying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).accentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(padding: EdgeInsets.all(10), child: Text('Now Playing')),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  iconSize: 20,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  autofocus: false,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  iconSize: 20,
                  padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                  autofocus: false,
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
        borderOnForeground: true,
        elevation: 20);
  }
}
