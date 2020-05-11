import 'package:flutter/material.dart';

class AnimatedBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Container(
        margin: const EdgeInsets.all(4.0),
        color: Colors.amber[600],
        width: 20.0,
        height: 12.0,
      ),
      Container(
        margin: const EdgeInsets.all(4.0),
        color: Colors.amber[600],
        width: 20.0,
        height: 24.0,
      ),
      Container(
        margin: const EdgeInsets.all(4.0),
        color: Colors.amber[600],
        width: 20.0,
        height: 48.0,
      )
    ]);
  }
}
