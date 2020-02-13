import 'package:audiobookly/core/viewmodels/library_list_view_model.dart';
import 'package:audiobookly/screens/library_select.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/core/viewmodels/server_list_view_model.dart';

class ServerSelect extends StatelessWidget {
  final ServerListViewModel _model;
  ServerSelect({
    @required ServerListViewModel model,
  }) : _model = model;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ServerListViewModel>(
      model: _model,
      onModelReady: (model) {
        model.getServers();
      },
      builder: (context, model, child) {
        return model.busy
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                appBar: AppBar(
                  title: Text('Select a Plex server'),
                  automaticallyImplyLeading: false,
                ),
                body: ListView.builder(
                    itemCount: model.servers.length,
                    itemBuilder: (context, position) {
                      return ListTile(
                          title: Text(model.servers[position].name),
                          onTap: () {
                            model.selectServer(position);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LibrarySelect(
                                          model: LibraryListViewModel(
                                              server: model.servers[position]),
                                        )));
                          });
                    }),
              );
      },
    );
  }
}
