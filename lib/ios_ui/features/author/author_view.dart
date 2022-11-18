import 'package:audiobookly/domain/books/books_notifier.dart';
import 'package:audiobookly/ios_ui/features/book_details/book_details_view.dart';
import 'package:audiobookly/ios_ui/widgets/bottom_padding.dart';
import 'package:audiobookly/ios_ui/widgets/grid_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/utils/utils.dart';

class AuthorView extends HookConsumerWidget {
  final String? mediaId;
  final String? title;
  final String? previousPageTitle;
  final Uri? artUri;
  final String? description;

  const AuthorView({
    super.key,
    this.mediaId,
    this.title,
    this.previousPageTitle,
    this.artUri,
    this.description,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksProvider = ref.watch(booksStateProvider(mediaId).notifier);
    final state = ref.watch(booksStateProvider(mediaId));
    return CupertinoPageScaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
      resizeToAvoidBottomInset: false,
      child: AbGridView(
        title: title ?? 'Books',
        previousPageTitle: previousPageTitle,
        onSearchChanged: mediaId == null ? booksProvider.onSearch : null,
        onRefresh: () async {
          await booksProvider.refresh();
        },
        child: state.when(
          initial: () => const SliverToBoxAdapter(),
          loaded: (books, mediaId, totalItems) => SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: books!.length,
              (context, index) {
                final book = books[index];
                return GridItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                BookDetailsView(mediaId: book.id)));
                  },
                  thumbnailUrl: book.artUri?.toString(),
                  title: book.title,
                  placeholder: CupertinoIcons.book_fill,
                  showTitle: false,
                  played: book.played,
                  progress: book.played ? 0 : Utils.getProgress(item: book),
                );
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              crossAxisCount: 3,
            ),
          ),
          loading: () => const SliverFillRemaining(
            child: Center(
              child: CupertinoActivityIndicator(radius: 30),
            ),
          ),
          error: (message, error, stack) => const SliverToBoxAdapter(),
        ),
      ),
    );
  }
}

class AbGridView extends HookWidget {
  const AbGridView({
    super.key,
    required this.title,
    required this.onRefresh,
    required this.child,
    this.previousPageTitle,
    this.onSearchChanged,
    this.artUri,
    this.description,
  });
  final String title;
  final Future Function() onRefresh;
  final Widget child;
  final String? previousPageTitle;
  final Function(String)? onSearchChanged;
  final Uri? artUri;
  final String? description;

  @override
  Widget build(context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
          largeTitle: Text(title),
          brightness: Brightness.dark,
          previousPageTitle: previousPageTitle,
        ),
        SliverToBoxAdapter(
          child: Center(
            child: CachedNetworkImage(
              imageUrl: artUri?.toString() ?? '',
              fit: BoxFit.scaleDown,
              errorWidget: (context, string, stack) {
                return const Icon(
                  CupertinoIcons.person_2_fill,
                  size: 30,
                );
              },
            ),
          ),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
        if (onSearchChanged != null)
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              // onSuffixTap: () => print('cleared'),
              onChanged: onSearchChanged,
            ),
          )),
        child,
        const SliverToBoxAdapter(child: BottomPadding()),
      ],
    );
  }
}
