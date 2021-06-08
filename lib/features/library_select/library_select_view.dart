import 'package:audiobookly/features/library_select/library_select_notifier.dart';
import 'package:audiobookly/features/library_select/library_select_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibrarySelectView extends HookWidget {
  LibrarySelectView();

  @override
  Widget build(BuildContext context) {
    final notifier = useProvider(libraryStateProvider.notifier);
    final state = useProvider(libraryStateProvider);

    if (state is LibrarySelectStateLoading)
      return Center(
        child: CircularProgressIndicator(),
      );
    else if (state is LibrarySelectStateLoaded)
      return Scaffold(
        appBar: AppBar(
          title: Text('Select a library'),
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          itemCount: state.libraries!.length,
          itemBuilder: (context, position) {
            final lib = state.libraries![position];
            return ListTile(
              title: Text(lib.title!),
              onTap: () async {
                await notifier.setLibrary(lib.id!);
                Navigator.pop(context, lib);
                // Provider.of<RootViewModel>(context).init();
              },
            );
          },
        ),
      );
    else if (state is LibrarySelectStateErrorDetails)
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(state.message!),
            ),
            // ElevatedButton(
            //   onPressed: _refresher.currentState.show,
            //   child: Text('Retry'),
            // )
          ],
        ),
      );
    else
      return Center(
        child: ElevatedButton(
          child: Text('Load'),
          onPressed: () {
            notifier.getLibraries();
          },
        ),
      );
  }
}
