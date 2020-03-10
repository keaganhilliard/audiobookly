import 'package:audiobookly/core/viewmodels/library_list_view_model.dart';
import 'package:audiobookly/core/viewmodels/server_list_view_model.dart';
import 'package:audiobookly/screens/library_select.dart';
import 'package:audiobookly/screens/server_select.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 24.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    'Server Type',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                DropdownButton<String>(
                  focusColor: Theme.of(context).accentColor,
                  onChanged: (value) {
                    print(value);
                  },
                  value: 'Plex',
                  items: [
                    DropdownMenuItem(
                      child: Text('Plex'),
                      value: 'Plex',
                    ),
                    DropdownMenuItem(
                      child: Text('Emby'),
                      value: 'Emby',
                    ),
                  ],
                ),
              ],
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Select Server'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ServerSelect(
                        model: ServerListViewModel(api: null),
                      );
                    },
                  ),
                );
              },
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Select Library'),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LibrarySelect(
                              model: LibraryListViewModel(
                                  server: Provider.of(context)),
                            )));
              },
            )
          ],
        ),
      ),
    );
    ;
  }
}
