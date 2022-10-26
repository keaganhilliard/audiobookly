import 'dart:io';

import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/domain/authors/authors_notifier.dart';
import 'package:audiobookly/domain/authors/authors_state.dart';
import 'package:audiobookly/material_ui/features/books/books_view.dart';
import 'package:audiobookly/material_ui/widgets/book_grid_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';

class AuthorsView extends HookConsumerWidget {
  const AuthorsView({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    final authorsProvider = ref.watch(authorsStateProvider.notifier);

    return ScaffoldWithoutFooter(
      refresh:
          !kIsWeb && !Platform.isAndroid && !Platform.isIOS && !Platform.isIOS,
      onRefresh: () {
        _refresher.currentState!.show();
      },
      title: const Text('Authors'),
      body: RefreshIndicator(
        key: _refresher,
        onRefresh: () async {
          print('refreshing');
          return authorsProvider.refresh();
        },
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(authorsStateProvider);
            return state.maybeWhen(
              orElse: () => Container(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (authors) => ResponsiveGridView<MediaItem>(
                items: authors,
                itemBuilder: (author) {
                  return OpenContainer(
                    closedElevation: 0.0,
                    closedColor: Theme.of(context).canvasColor,
                    openColor: Theme.of(context).canvasColor,
                    openBuilder: (context, closeContainer) => BooksView(
                      mediaId: author.id,
                      title: author.title,
                    ),
                    closedBuilder: (context, openContainer) => BookGridItem(
                      onTap: openContainer,
                      thumbnailUrl: author.artUri?.toString(),
                      title: author.title,
                      placeholder: Icons.person,
                      showTitle: true,
                    ),
                  );
                },
              ),
              error: (message) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Could not fetch authors, is the device online?',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _refresher.currentState!.show();
                    },
                    child: const Text('Retry'),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
