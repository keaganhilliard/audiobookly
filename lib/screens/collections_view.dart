import 'package:audiobookly/core/viewmodels/collections_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';
import 'package:flutter/material.dart';
import 'package:plex_api/plex_api.dart';
import 'package:provider/provider.dart';

class CollectionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlexLibrary library = Provider.of(context);

    return ScaffoldWithoutFooter(
      title: Text('Collections'),
      body: BaseWidget<CollectionsViewModel>(
          onModelReady: (model) => model.fetchCollections(library.key),
          model: CollectionsViewModel(server: Provider.of(context)),
          builder: (context, model, child) {
            return model.busy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: model.collections.length,
                    itemBuilder: (context, index) {
                      PlexCollection collection = model.collections[index];
                      // return Card(
                      //   child: InkWell(
                      //     onTap: () {},
                      //     child: Padding(
                      //         padding: EdgeInsets.all(10),
                      //         child: Text(collection.title)),
                      //   ),
                      // );
                      return ListTile(
                        title: Text(collection.title),
                        onTap: () {
                          print(collection.fastKey);
                          Navigator.of(context)
                              .pushNamed(Routes.Collection, arguments: {
                            'fastKey': collection.fastKey,
                            'title': collection.title,
                          });
                        },
                      );
                    },
                  );
          }),
    );
  }
}
