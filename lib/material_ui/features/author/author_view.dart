import 'package:audiobookly/domain/author/author_notifier.dart';
import 'package:audiobookly/domain/author/author_state.dart';
import 'package:audiobookly/material_ui/widgets/cover_item.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/router.dart';
import 'package:audiobookly/utils/refresh_indicator_key.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthorView extends HookConsumerWidget {
  final String authorId;
  const AuthorView({required this.authorId, super.key});

  Widget _loadingIndicator() => Container();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(authorStateProvider(authorId).notifier);
    final state = ref.watch(authorStateProvider(authorId));
    final refreshState = useRefreshIndicatorKey();

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
            key: notifier.refreshState,
            onRefresh: () async {
              await notifier.refresh();
            },
            child: switch (state) {
              AuthorStateInitial() => _loadingIndicator(),
              AuthorStateLoading() => _loadingIndicator(),
              AuthorStateError(:final message) =>
                Center(child: Text('Something went wrong $message')),
              AuthorStateLoaded(:final author) => CustomScrollView(
                  key: const PageStorageKey('author-details'),
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: true,
                      shadowColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      backgroundColor: Theme.of(context).canvasColor,
                      centerTitle: true,
                      floating: true,
                      pinned: true,
                      title: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(author!.name),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (author.largeArtPath != null ||
                                author.artPath != null)
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: CachedNetworkImage(
                                  imageUrl: author.largeArtPath ??
                                      author.artPath ??
                                      '',
                                  fit: BoxFit.scaleDown,
                                  errorWidget: (context, string, stack) {
                                    return const Icon(
                                        CupertinoIcons.person_2_fill);
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (author.description?.isNotEmpty == true)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ExpandableNotifier(
                            child: Column(
                              children: [
                                Expandable(
                                  collapsed: Column(
                                    children: [
                                      Text(
                                        author.description!,
                                        softWrap: true,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      ExpandableButton(
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16.0,
                                            vertical: 8.0,
                                          ),
                                          child: Text('More'),
                                        ),
                                      )
                                    ],
                                  ),
                                  expanded: Column(
                                    children: [
                                      Text(
                                        author.description!,
                                        softWrap: true,
                                      ),
                                      ExpandableButton(
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                            vertical: 8.0,
                                          ),
                                          child: Text('Less'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    SliverToBoxAdapter(
                      child: RowTitle(title: "${author.numBooks} Books"),
                    ),
                    SliverToBoxAdapter(
                      child: BooksScrollView(
                        books: author.books!,
                        valKey: PageStorageKey(author.id),
                      ),
                    ),
                    if (author.series != null && author.series!.isNotEmpty)
                      for (final series in author.series!)
                        if (series.books != null &&
                            series.books!.isNotEmpty) ...[
                          SliverToBoxAdapter(
                              child: RowTitle(
                            title: series.name,
                            subtitle: "Series",
                          )),
                          SliverToBoxAdapter(
                            child: BooksScrollView(
                              books: series.books!,
                              valKey: PageStorageKey(series.id),
                            ),
                          )
                        ]
                  ],
                ),
            }),
      ),
    );
  }
}

class RowTitle extends StatelessWidget {
  const RowTitle({super.key, required this.title, this.subtitle});
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class BooksScrollView extends StatelessWidget {
  const BooksScrollView({super.key, required this.books, required this.valKey});
  final List<Book> books;
  final ValueKey<String> valKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
            key: valKey,
            itemCount: books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final book = books[index];
              return CoverItem(
                onTap: () {
                  router.pushEnumWithId(Routes.book, book.id);
                },
                thumbnailUrl: book.artPath,
                title: book.title,
                subtitle: book.publishedYear,
                progress: book.progress,
                played: book.read,
              );
            }),
      ),
    );
  }
}
