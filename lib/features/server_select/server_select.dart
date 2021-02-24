import 'package:audiobookly/models/library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ServerSelect extends HookWidget {
  final List<Library> _servers;
  ServerSelect(this._servers);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Plex server'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: _servers.length,
          itemBuilder: (context, position) {
            return ListTile(
                title: Text(_servers[position].title),
                onTap: () {
                  Navigator.pop(context, _servers[position]);
                });
          }),
    );
  }
}
