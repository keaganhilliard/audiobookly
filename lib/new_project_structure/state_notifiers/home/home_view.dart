import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/cubit/books/books_cubit.dart';
import 'package:audiobookly/cubit/books/books_state.dart';
import 'package:audiobookly/new_project_structure/repositories/media/media_repository.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/home/home_notifier.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/home/home_row.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/home/home_state.dart';
import 'package:audiobookly/screens/book_view.dart';
import 'package:audiobookly/ui/book_grid_item.dart';
import 'package:audiobookly/ui/responsive_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider/provider.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';

class HomeView extends HookWidget {
  HomeView();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    final homeProvider = useProvider(homeStateProvider);
    final state = useProvider(homeStateProvider.state);

    return ScaffoldWithoutFooter(
      title: Text('Audiobookly'),
      body: RefreshIndicator(
        key: _refresher,
        onRefresh: () async {
          print('refreshing');
          return homeProvider.getBooks();
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            print(constraints);
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
    );
  }
}
