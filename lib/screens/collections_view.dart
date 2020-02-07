import 'package:audiobookly/core/viewmodels/collections_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:flutter/material.dart';

class CollectionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<CollectionsViewModel>(
        model: CollectionsViewModel(server: null),
        builder: (context, model, child) {
          return model.busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Some shit')),
                      ),
                    );
                  },
                );
        });
  }
}
