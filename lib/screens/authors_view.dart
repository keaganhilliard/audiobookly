import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/authors_view_model.dart';
import 'package:audiobookly/ui/responsive_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:provider/provider.dart';
import 'package:audiobookly/ui/book_grid_item.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';

class AuthorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    child: ResponsiveGridView(
                      items: model.items,
                      itemBuilder: (item) => BookGridItem(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.Author, arguments: {
                            'authorId': item.id,
                            'authorName': item.title,
                          });
                        },
                        thumbnailUrl: item.artUri,
                        title: item.title,
                      ),
                    ),
                  );
          }),
    );
  }
}
