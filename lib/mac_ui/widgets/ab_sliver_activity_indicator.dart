import 'package:flutter/cupertino.dart';

class AbSliverActivityIndicator extends StatelessWidget {
  const AbSliverActivityIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: Center(
        child: CupertinoActivityIndicator(radius: 30),
      ),
    );
  }
}
