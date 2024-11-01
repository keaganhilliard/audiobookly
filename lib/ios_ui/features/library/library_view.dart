import 'package:audiobookly/domain/books/books_notifier.dart';
import 'package:audiobookly/ios_ui/features/book_details/book_details_page_view.dart';
import 'package:audiobookly/ios_ui/features/home/home.dart';
import 'package:audiobookly/ios_ui/widgets/bottom_padding.dart';
import 'package:audiobookly/ios_ui/widgets/grid_item.dart';
import 'package:audiobookly/ios_ui/widgets/sidebar_button.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pageTitles = ['Books', 'Authors', 'Series', 'Playlists', 'Collections'];

class LibraryView extends HookConsumerWidget {
  const LibraryView({
    super.key,
    required this.shell,
    required this.children,
    this.previousPageTitle,
  });
  final String? previousPageTitle;
  final StatefulNavigationShell shell;
  final List<Widget> children;

  @override
  Widget build(context, ref) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
          middle: Text(
            pageTitles[shell.currentIndex],
          ),
          alwaysShowMiddle: false,
          largeTitle: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderButton(shell: shell, index: 0, title: 'Books'),
                HeaderButton(shell: shell, index: 1, title: 'Authors'),
                HeaderButton(shell: shell, index: 2, title: 'Series'),
                HeaderButton(shell: shell, index: 3, title: 'Playlists'),
                HeaderButton(shell: shell, index: 4, title: 'Collections'),
              ],
            ),
          ),
          brightness: Brightness.dark,
          previousPageTitle: previousPageTitle,
          leading: !ref.watch(showSidebarProvider) && previousPageTitle == null
              ? const SidebarButton()
              : null,
        ),
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            // await booksProvider.refresh();
          },
        ),
        SliverFillRemaining(
          child: children[shell.currentIndex],
        ),
        const SliverToBoxAdapter(child: BottomPadding()),
      ],
    );
  }
}

class HeaderButton extends StatelessWidget {
  final StatefulNavigationShell shell;
  final int index;
  final String title;

  const HeaderButton({
    super.key,
    required this.shell,
    required this.index,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isCurrent = shell.currentIndex == index;
    return Padding(
      padding:
          isCurrent ? const EdgeInsets.all(10.0) : const EdgeInsets.all(8.0),
      child: CupertinoButton(
        onPressed: () => shell.goBranch(
          index,
          initialLocation: isCurrent,
        ),
        child: Text(
          title,
          style: isCurrent ? const TextStyle(fontSize: 24) : null,
        ),
      ),
    );
  }
}

class BookGridView extends HookConsumerWidget {
  final String? mediaId;

  const BookGridView({super.key, this.mediaId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(booksStateProvider(mediaId));
    return LayoutBuilder(builder: (context, constraints) {
      return state.when(
        initial: () => Container(),
        loaded: (books, mediaId, totalItems) => GridView.builder(
          itemCount: books!.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return GridItem(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => BookDetailsView(mediaId: book.id),
                  ),
                );
              },
              thumbnailUrl: book.artUri?.toString(),
              title: book.title,
              placeholder: CupertinoIcons.book_fill,
              showTitle: false,
              played: book.played,
              progress: book.played ? 0 : Utils.getProgress(item: book),
            );
          },
          // delegate: SliverChildBuilderDelegate(
          //   childCount: books!.length,
          //   (context, index) {

          //   },
          // ),
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
      );
    });
  }
}
