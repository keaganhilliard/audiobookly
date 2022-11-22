import 'package:audiobookly/domain/home/home_notifier.dart';
import 'package:audiobookly/mac_ui/widgets/ab_scaffold.dart';
import 'package:audiobookly/mac_ui/features/home/home_row.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateProvider);
    const double rowHeight = 250;

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyR, meta: true): () {
          ref.read(homeStateProvider.notifier).refresh();
        }
      },
      child: AbScaffold(
        child: state.when(
          initial: () => const SliverToBoxAdapter(),
          loaded: (rowsData, downloaded) => SliverList(
            delegate: SliverChildListDelegate([
              if (rowsData != null) ...[
                for (final entry in rowsData.entries)
                  HomeRow(
                    height: rowHeight,
                    title: entry.key,
                    items: entry.value,
                  )
              ],
              if (!nullOrEmpty(downloaded))
                HomeRow(
                  height: rowHeight,
                  title: 'Downloaded',
                  items: downloaded,
                ),
            ]),
          ),
          loading: () => const SliverFillRemaining(
            child: Center(
              child: CupertinoActivityIndicator(radius: 30),
            ),
          ),
          error: (message) => SliverToBoxAdapter(
            child: Center(
              child: Text(message ?? 'Error'),
            ),
          ),
        ),
      ),
    );
  }
}
