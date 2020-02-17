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

    return ScaffoldWithoutFooter(
      title: Text('Authors'),
      body: BaseWidget<AuthorsViewModel>(
          model: AuthorsViewModel(server: _server),
          onModelReady: (model) {
            model.getAuthors(_library.key);
          },
          builder: (context, model, child) {
            return model.busy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.745,
                    padding: EdgeInsets.all(10.0),
                    children: model.authors.map((author) {
                      print(author.toJson());
                      return BookGridItem(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.Author, arguments: {
                            'authorId': author.ratingKey,
                            'authorName': author.title,
                          });
                        },
                        thumbnailUrl: _server.getUrlWithToken(author.thumb),
                        title: author.title,
                      );
                    }).toList(),
                  );
          }),
    );
  }
}
