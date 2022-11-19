import 'package:flutter/material.dart';

class CreationAwareListItem extends StatefulWidget {
  final Function itemCreated;
  final Widget child;
  const CreationAwareListItem({
    super.key,
    required this.itemCreated,
    required this.child,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CreationAwareListItemState createState() => _CreationAwareListItemState();
}

class _CreationAwareListItemState extends State<CreationAwareListItem> {
  @override
  void initState() {
    super.initState();
    widget.itemCreated();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
