import 'package:audiobookly/core/viewmodels/home_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/ui/book_row.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      model: HomeViewModel(communicator: Provider.of(context)),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return ScaffoldWithoutFooter(
          title: Text('Audiobookly'),
          body: model.busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 40),
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BookRow(
                          title: 'In Progress',
                          model: model.recentlyPlayedModel,
                        ),
                        BookRow(
                          title: 'Recently Added',
                          model: model.recentlyAddedModel,
                        ),
                      ],
                    ),
                  ),
                  onRefresh: () async {
                    await model.onRefresh();
                  }),
        );
      },
    );
  }
}
