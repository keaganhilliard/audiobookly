import 'dart:io';

import 'package:audiobookly/domain/home/home_notifier.dart';
import 'package:audiobookly/material_ui/features/home/home_row.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';
import 'dart:math' as math;

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> refresher =
        GlobalKey<RefreshIndicatorState>();

    final homeProvider = ref.watch(homeStateProvider.notifier);
    // final state = useProvider(homeStateProvider.state);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      onRefresh: () {
        refresher.currentState!.show();
      },
      title: const Text('Audiobookly'),
      body: RefreshIndicator(
        key: refresher,
        onRefresh: () async {
          return homeProvider.refresh();
        },
        child: LayoutBuilder(
          builder: (context, constraints) => Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(homeStateProvider);
              final double rowHeight =
                  constraints.maxHeight > constraints.maxWidth
                      ? math.min(((constraints.maxHeight - 120) / 2), 250)
                      : 225;

              return state.maybeWhen(
                orElse: () => Container(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (rowsData, downloaded) => SingleChildScrollView(
                  // padding: EdgeInsets.only(bottom: 40),
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
