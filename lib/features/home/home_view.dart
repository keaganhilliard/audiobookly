import 'dart:io';

import 'package:audiobookly/features/home/home_notifier.dart';
import 'package:audiobookly/features/home/home_row.dart';
import 'package:audiobookly/features/home/home_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/widgets/scaffold_without_footer.dart';
import 'dart:math' as math;

class HomeView extends HookConsumerWidget {
  const HomeView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    final homeProvider = ref.watch(homeStateProvider.notifier);
    // final state = useProvider(homeStateProvider.state);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      onRefresh: () {
        _refresher.currentState!.show();
      },
      title: const Text('Audiobookly'),
      body: RefreshIndicator(
        key: _refresher,
        onRefresh: () async {
          return homeProvider.getBooks();
        },
        child: LayoutBuilder(
          builder: (context, constraints) => Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(homeStateProvider);

              final double rowHeight =
                  constraints.maxHeight > constraints.maxWidth
                      ? math.min(((constraints.maxHeight - 120) / 2), 250)
                      : 225;

              if (state is HomeStateInitial) _refresher.currentState!.show();
              if (state is HomeStateLoaded) {
                return SingleChildScrollView(
                  // padding: EdgeInsets.only(bottom: 40),
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.recentlyPlayed != null &&
                          state.recentlyPlayed!.isNotEmpty)
                        HomeRow(
                          height: rowHeight,
                          // math.min(((constraints.maxHeight - 120) / 2), 250),
                          title: 'Continue Listening',
                          items: state.recentlyPlayed,
                        ),
                      if (state.recentlyAdded != null &&
                          state.recentlyAdded!.isNotEmpty)
                        HomeRow(
                          height: rowHeight,
                          title: 'Recently Added',
                          items: state.recentlyAdded,
                        ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
