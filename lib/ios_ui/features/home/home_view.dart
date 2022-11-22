import 'package:audiobookly/domain/home/home_notifier.dart';
import 'package:audiobookly/ios_ui/features/home/home_row.dart';
import 'package:audiobookly/ios_ui/widgets/bottom_padding.dart';
import 'package:audiobookly/models/model_union.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeProvider = ref.watch(homeStateProvider.notifier);
    final state = ref.watch(homeStateProvider);
    const double rowHeight = 250;

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      resizeToAvoidBottomInset: false,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
            largeTitle: Text('Audiobookly'),
            brightness: Brightness.dark,
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await homeProvider.refresh();
            },
          ),
          // CupertinoSearchTextField(),
          state.when(
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
                const BottomPadding(),
              ]),
            ),
            loading: () => const SliverFillRemaining(
              child: Center(
                child: CupertinoActivityIndicator(radius: 30),
              ),
            ),
            error: (message) => const SliverToBoxAdapter(),
          ),
        ],
      ),
    );
  }
}
