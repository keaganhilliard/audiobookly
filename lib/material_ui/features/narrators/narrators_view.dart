import 'package:audiobookly/domain/narrators/narrators_notifier.dart';
import 'package:audiobookly/domain/narrators/narrators_state.dart';
import 'package:audiobookly/models/author.dart';
import 'package:audiobookly/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';

class NarratorsView extends HookConsumerWidget {
  const NarratorsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldWithoutFooter(
      title: const Text('Narrators'),
      body: NarratorsComponent(),
    );
  }
}

class NarratorsComponent extends HookConsumerWidget {
  const NarratorsComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> refresher =
        GlobalKey<RefreshIndicatorState>();

    final narratorsProvider = ref.watch(narratorsStateProvider.notifier);

    return RefreshIndicator(
      key: refresher,
      onRefresh: () async {
        return narratorsProvider.refresh();
      },
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(narratorsStateProvider);
          switch (state) {
            case NarratorsStateInitial():
              refresher.currentState?.show();
            case NarratorsStateLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case NarratorsStateError():
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Could not fetch narrators, is the device online?',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      refresher.currentState!.show();
                    },
                    child: const Text('Retry'),
                  )
                ],
              );
            case NarratorsStateLoaded(:final narrators):
              return ListView.separated(
                itemCount: narrators!.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey.shade700,
                ),
                itemBuilder: (context, index) {
                  final Author(:name, :id, :numBooks) = narrators[index];
                  return ListTile(
                    visualDensity: VisualDensity(
                      vertical: VisualDensity.minimumDensity,
                    ),
                    title: Text(name),
                    trailing: Text("$numBooks"),
                    onTap: () async {
                      router.pushId(id, extra: name);
                    },
                  );
                },
              );
          }
          return CustomScrollView();
        },
      ),
    );
  }
}
