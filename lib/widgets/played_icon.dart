import 'package:flutter/material.dart';

class PlayedIcon extends StatelessWidget {
  const PlayedIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 5.0),
      child: Align(
        // child: ClipOval(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  // offset: Offset(2.0, 2.0),
                  spreadRadius: 1.0)
            ],
          ),
          // color: Colors.white,
          child: Icon(
            Icons.check_circle_rounded,
            color: Theme.of(context).accentColor,
          ),
        ),
        // ),
        alignment: Alignment.topRight,
      ),
    );
  }
}
