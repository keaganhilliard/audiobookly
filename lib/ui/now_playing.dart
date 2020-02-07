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
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Listening',
                  style: TextStyle(color: Colors.white),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  //forward_10/forward_30
                  color: Colors.white,
                  icon: Icon(Icons.replay_30),
                  iconSize: 25,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  autofocus: false,
                  onPressed: () {},
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.play_arrow),
                  iconSize: 25,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  autofocus: false,
                  onPressed: () {},
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.close),
                  iconSize: 25,
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
