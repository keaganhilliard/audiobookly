import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/authors_view_model.dart';
import 'package:flutter/material.dart';
import 'package:plex_api/plex_api.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:provider/provider.dart';
import 'package:audiobookly/ui/book_grid_item.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';

class AuthorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlexLibrary _library = Provider.of(context);
    final PlexServerV2 _server = Provider.of(context);
    final ServerCommunicator _communicator = Provider.of(context);

    return ScaffoldWithoutFooter(
      title: Text('Authors'),
      body: BaseWidget<AuthorsViewModel>(
          model: AuthorsViewModel(communicator: _communicator),
          onModelReady: (model) {
            model.getAuthors();
          },
          builder: (context, model, child) {
            return model.busy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: model.onRefresh,
                    child: GridView.count(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 2
                          : 6,
                      childAspectRatio: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 0.745
                          : 0.51,
                      padding: EdgeInsets.all(10.0),
                      children: model.items
                          .map((item) => BookGridItem(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.Author, arguments: {
                                    'authorId': item.id,
                                    'authorName': item.title,
                                  });
                                },
                                thumbnailUrl: item.artUri,
                                title: item.title,
                              ))
                          .toList(),
                    ),
                  );
          }),
    );
  }
}
