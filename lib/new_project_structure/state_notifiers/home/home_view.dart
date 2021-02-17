import 'package:audiobookly/new_project_structure/state_notifiers/home/home_notifier.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/home/home_row.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';

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
        child: Consumer(
          builder: (context, read, child) => LayoutBuilder(
            builder: (context, constraints) {
              print(constraints);
              final state = read(homeStateProvider.state);
              if (state is HomeStateInitial) _refresher.currentState.show();
              if (state is HomeStateLoaded)
                return SingleChildScrollView(
                  // padding: EdgeInsets.only(bottom: 40),
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeRow(
                        height: (constraints.maxHeight - 120) / 2,
                        title: 'In Progress',
                        items: state.recentlyPlayed,
                      ),
                      HomeRow(
                        height: (constraints.maxHeight - 120) / 2,
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
