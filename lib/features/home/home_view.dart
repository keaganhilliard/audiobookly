import 'package:audiobookly/features/home/home_notifier.dart';
import 'package:audiobookly/features/home/home_row.dart';
import 'package:audiobookly/features/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/widgets/scaffold_without_footer.dart';
import 'dart:math' as math;

class HomeView extends HookWidget {
  HomeView();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    final homeProvider = useProvider(homeStateProvider);
    // final state = useProvider(homeStateProvider.state);

    return ScaffoldWithoutFooter(
      title: Text('Audiobookly'),
      body: RefreshIndicator(
        key: _refresher,
        onRefresh: () async {
          print('refreshing');
          return homeProvider.getBooks();
        },
        child: LayoutBuilder(
          builder: (context, constraints) => Consumer(
            builder: (context, watch, child) {
              final state = watch(homeStateProvider.state);
              print(constraints);
              if (state is HomeStateInitial) _refresher.currentState.show();
              if (state is HomeStateLoaded)
                return SingleChildScrollView(
                  // padding: EdgeInsets.only(bottom: 40),
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeRow(
                        height:
                            math.min(((constraints.maxHeight - 120) / 2), 300),
                        title: 'In Progress',
                        items: state.recentlyPlayed,
                      ),
                      HomeRow(
                        height:
                            math.min(((constraints.maxHeight - 120) / 2), 300),
                        title: 'Recently Added',
                        items: state.recentlyAdded,
                      ),
                    ],
                  ),
                );
              else
                return Container();
            },
          ),
        ),
      ),
    );
  }
}
