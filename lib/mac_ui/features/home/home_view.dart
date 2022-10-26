import 'package:audiobookly/domain/home/home_notifier.dart';
import 'package:audiobookly/mac_ui/widgets/ab_scaffold.dart';
import 'package:audiobookly/mac_ui/features/home/home_row.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateProvider);
    const double rowHeight = 250;

    return AbScaffold(
      child: state.when(
        initial: () => const SliverToBoxAdapter(),
        loaded: (recentlyPlayed, recentlyAdded, downloaded) => SliverList(
          delegate: SliverChildListDelegate([
            if (!nullOrEmpty(recentlyPlayed))
              HomeRow(
                height: rowHeight,
                title: 'Continue Listening',
                items: recentlyPlayed,
              ),
            if (!nullOrEmpty(recentlyAdded))
              HomeRow(
                height: rowHeight,
                title: 'Recently Added',
                items: recentlyAdded,
              ),
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
        error: (message) => const SliverToBoxAdapter(),
      ),
    );
  }
}
