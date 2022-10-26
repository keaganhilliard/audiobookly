import 'package:audiobookly/domain/series/series_notifier.dart';
import 'package:audiobookly/mac_ui/features/books/books_view.dart';
import 'package:audiobookly/mac_ui/widgets/ab_grid.dart';
import 'package:audiobookly/mac_ui/widgets/ab_scaffold.dart';
import 'package:audiobookly/mac_ui/widgets/grid_item.dart';
import 'package:audiobookly/mac_ui/features/home/home_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SeriesView extends HookConsumerWidget {
  final String? title;
  final String? previousPageTitle;
  final Debouncer debouncer = Debouncer(milliseconds: 1);

  SeriesView({
    super.key,
    this.title,
    this.previousPageTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(seriesStateProvider);
    return AbScaffold(
        child: state.when(
      initial: () => const SliverToBoxAdapter(),
      loaded: (series) => AbGrid(
        childCount: series!.length,
        childBuilder: (context, index) {
          final serie = series[index];
          return GridItem(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => BooksView(
                    mediaId: serie.id,
                  ),
                ),
              );
            },
            thumbnailUrl: serie.artUri?.toString(),
            title: serie.title,
            placeholder: CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
            showTitle: true,
          );
        },
      ),
      loading: () => const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(radius: 30),
        ),
      ),
      error: (message) => const SliverToBoxAdapter(),
    ));
  }
}
