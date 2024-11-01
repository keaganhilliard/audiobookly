import 'package:audiobookly/domain/library_select/library_select_notifier.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class MacosLibrarySelectView extends HookConsumerWidget {
  const MacosLibrarySelectView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(libraryStateProvider.notifier);
    final state = ref.watch(libraryStateProvider);
    final navigationService = ref.watch(navigationServiceProvider);

    return state.when(
      initial: () => const Center(
        child: CupertinoActivityIndicator(),
      ),
      loaded: (libraries) => MacosScaffold(
        toolBar: const ToolBar(
          automaticallyImplyLeading: false,
          title: Text('Select a Library'),
        ),
        children: [
          ContentArea(builder: (context, scrollController) {
            return ListView.builder(
              controller: scrollController,
              itemCount: libraries!.length,
              itemBuilder: (context, position) {
                final lib = libraries[position];
                return CupertinoListTile(
                  title: Text(lib.title!),
                  onTap: () async {
                    await notifier.setLibrary(lib.id!, lib.title);
                    navigationService.pop(lib);
                    // Provider.of<RootViewModel>(context).init();
                  },
                );
              },
            );
          }),
        ],
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
