import 'package:audiobookly/domain/library_select/library_select_notifier.dart';
import 'package:audiobookly/domain/library_select/library_select_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibrarySelectView extends HookConsumerWidget {
  const LibrarySelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(libraryStateProvider.notifier);
    final state = ref.watch(libraryStateProvider);

    if (state is LibrarySelectStateLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is LibrarySelectStateLoaded) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Select a library'),
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          itemCount: state.libraries!.length,
          itemBuilder: (context, position) {
            final lib = state.libraries![position];
            return ListTile(
              title: Text(lib.title!),
              onTap: () async {
                notifier.setLibrary(lib.id!);
                Navigator.pop(context, lib);
              },
            );
          },
        ),
      );
    } else if (state is LibrarySelectStateErrorDetails) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(state.message!),
            // ElevatedButton(
            //   onPressed: _refresher.currentState.show,
            //   child: Text('Retry'),
            // )
          ],
        ),
      );
    } else {
      return Center(
        child: ElevatedButton(
          child: const Text('Load'),
          onPressed: () {
            notifier.getLibraries();
          },
        ),
      );
    }
  }
}
