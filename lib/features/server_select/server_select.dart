import 'package:flutter/material.dart';

class ServerSelect extends StatelessWidget {
  // final ServerListViewModel _model;
  // ServerSelect({
  //   @required ServerListViewModel model,
  // }) : _model = model;

  @override
  Widget build(BuildContext context) {
    return Container();
    // return BaseWidget<ServerListViewModel>(
    //   model: _model,
    //   onModelReady: (model) {
    //     model.getServers();
    //   },
    //   builder: (context, model, child) {
    //     return model.busy
    //         ? Center(child: CircularProgressIndicator())
    //         : Scaffold(
    //             appBar: AppBar(
    //               title: Text('Select a Plex server'),
    //               automaticallyImplyLeading: false,
    //             ),
    //             body: ListView.builder(
    //                 itemCount: model.servers.length,
    //                 itemBuilder: (context, position) {
    //                   return ListTile(
    //                       title: Text(model.servers[position].name),
    //                       onTap: () {
    //                         model.selectServer(position);
    //                         Navigator.pop(context, model.servers[position]);
    //                         // Navigator.pushReplacement(
    //                         //     context,
    //                         //     MaterialPageRoute(
    //                         //         builder: (context) => LibrarySelect(
    //                         //               model: LibraryListViewModel(
    //                         //                   server: model.servers[position]),
    //                         //             )));
    //                       });
    //                 }),
    //           );
    //   },
    // );
  }
}
