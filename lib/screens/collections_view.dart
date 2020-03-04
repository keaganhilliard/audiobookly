import 'package:audiobookly/core/viewmodels/collections_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithoutFooter(
      title: Text('Collections'),
      body: BaseWidget<CollectionsViewModel>(
          onModelReady: (model) => model.fetchCollections(),
          model: CollectionsViewModel(communicator: Provider.of(context)),
          builder: (context, model, child) {
            if (model.busy)
              return Center(
                child: CircularProgressIndicator(),
              );
            else {
              return RefreshIndicator(
                onRefresh: model.onRefresh,
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: model.collections.length,
                  itemBuilder: (context, index) {
                    var item = model.collections[index];
                    return ListTile(
                      title: Text(item.title),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(Routes.Collection, arguments: {
                          'collectionId': item.id,
                          'title': item.title,
                        });
                      },
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
