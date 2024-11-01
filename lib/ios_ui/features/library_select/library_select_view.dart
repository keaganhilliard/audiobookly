import 'package:audiobookly/domain/library_select/library_select_notifier.dart';
import 'package:audiobookly/router.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IosLibrarySelectView extends HookConsumerWidget {
  const IosLibrarySelectView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(libraryStateProvider.notifier);
    final state = ref.watch(libraryStateProvider);

    return state.when(
      initial: () => const Center(
        child: CupertinoActivityIndicator(),
      ),
      loaded: (libraries) => CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: CupertinoColors.black,
          middle: Text('Select a Library'),
        ),
        child: ListView.builder(
          itemCount: libraries!.length,
          itemBuilder: (context, position) {
            final lib = libraries[position];
            return CupertinoListTile(
              title: Text(lib.title!),
              onTap: () async {
                await notifier.setLibrary(lib.id!, lib.title);
                router.goEnum(Routes.home);
                // context.pop();
                // Provider.of<RootViewModel>(context).init();
              },
            );
          },
        ),
      ),
      loading: () => const Center(
        child: CupertinoActivityIndicator(),
      ),
      error: (message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(message!),
            // ElevatedButton(
            //   onPressed: _refresher.currentState.show,
            //   child: Text('Retry'),
            // )
          ],
        ),
      ),
    );
  }
}
