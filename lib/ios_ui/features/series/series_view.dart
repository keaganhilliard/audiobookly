import 'package:audiobookly/domain/series/series_notifier.dart';
import 'package:audiobookly/ios_ui/features/books/books_view.dart';
import 'package:audiobookly/ios_ui/widgets/ab_grid_view.dart';
import 'package:audiobookly/ios_ui/widgets/grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SeriesView extends HookConsumerWidget {
  const SeriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seriesProvider = ref.watch(seriesStateProvider.notifier);
    final state = ref.watch(seriesStateProvider);
    return LayoutBuilder(builder: (context, constraints) {
      return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        resizeToAvoidBottomInset: false,
        child: AbGridView(
          title: 'Series',
          onRefresh: () async {
            await seriesProvider.refresh();
          },
          child: state.when(
            initial: () => const SliverToBoxAdapter(),
            loaded: (series) => SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: series!.length,
                (context, index) {
                  final serie = series[index];
                  return GridItem(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => BooksView(
                            mediaId: serie.id,
                            title: serie.title,
                            previousPageTitle: 'Series',
                          ),
                        ),
                      );
                    },
                    thumbnailUrl: serie.artUri?.toString(),
                    title: serie.title,
                    placeholder:
                        CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
                    showTitle: true,
                  );
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (constraints.maxWidth / 250).ceil(),
              ),
            ),
            loading: () => const SliverFillRemaining(
              child: Center(
                child: CupertinoActivityIndicator(radius: 30),
              ),
            ),
            error: (message) => const SliverToBoxAdapter(),
          ),
        ),
      );
    });
  }
}
