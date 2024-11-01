import 'package:audiobookly/domain/home/home_notifier.dart';
import 'package:audiobookly/domain/home/home_state.dart';
import 'package:audiobookly/ios_ui/features/home/home.dart';
import 'package:audiobookly/ios_ui/features/home/home_row.dart';
import 'package:audiobookly/ios_ui/widgets/bottom_padding.dart';
import 'package:audiobookly/ios_ui/widgets/sidebar_button.dart';
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
          CupertinoSliverNavigationBar(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.8),
            largeTitle: const Text('Audiobookly'),
            leading:
                !ref.watch(showSidebarProvider) ? const SidebarButton() : null,
            brightness: Brightness.dark,
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await homeProvider.refresh();
            },
          ),
          // CupertinoSearchTextField(),
          switch (state) {
            HomeStateInitial() => const SliverFillRemaining(),
            HomeStateLoading() => const SliverFillRemaining(
                child: Center(
                  child: CupertinoActivityIndicator(radius: 30),
                ),
              ),
            HomeStateLoaded(:final rowsData, :final downloaded) => SliverList(
                delegate: SliverChildListDelegate(
                  [
                    if (rowsData != null) ...[
                      for (final MapEntry(:key, :value) in rowsData.entries)
                        HomeRow(
                          height: rowHeight,
                          title: key,
                          items: value,
                        )
                    ],
                    if (!nullOrEmpty(downloaded))
                      HomeRow(
                        height: rowHeight,
                        title: 'Downloaded',
                        items: downloaded!,
                      ),
                    const BottomPadding(),
                  ],
                ),
              ),
            HomeStateError(:final message) => SliverFillRemaining(
                child: Center(
                  child: Column(
                    children: [
                      const Text("There was an issue"),
                      Text(message ?? 'Unknown error'),
                      CupertinoButton.filled(
                        child: const Text('Retry'),
                        onPressed: () async {
                          await homeProvider.refresh();
                        },
                      ),
                    ],
                  ),
                ),
              ),
          },
        ],
      ),
    );
  }
}
