import 'package:audiobookly/core/viewmodels/library_list_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:flutter/material.dart';

class LibrarySelect extends StatelessWidget {
  final LibraryListViewModel _model;
  LibrarySelect({@required LibraryListViewModel model}) : _model = model;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LibraryListViewModel>(
      model: _model,
      onModelReady: (model) {
        model.getLibraries();
      },
      builder: (context, model, child) {
        return model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: AppBar(
                  title: Text('Select a Plex library'),
                  automaticallyImplyLeading: false,
                ),
                body: ListView.builder(
                  itemCount: model.libraries.length,
                  itemBuilder: (context, position) {
                    return ListTile(
                      title: Text(model.libraries[position].title),
                      onTap: () {
                        model.setLibrary(position);
                        Navigator.pop(context);
                        // Provider.of<RootViewModel>(context).init();
                      },
                    );
                  },
                ),
              );
      },
    );
  }
}
