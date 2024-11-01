import 'dart:io';

import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/aspect_ratios.dart';
import 'package:audiobookly/domain/authors/authors_notifier.dart';
import 'package:audiobookly/domain/authors/authors_state.dart';
import 'package:audiobookly/material_ui/features/books/books_view.dart';
import 'package:audiobookly/material_ui/widgets/book_grid_item.dart';
import 'package:audiobookly/material_ui/widgets/cover_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:audiobookly/models/author.dart';
import 'package:audiobookly/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';

class AuthorsView extends HookConsumerWidget {
  const AuthorsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldWithoutFooter(
        title: const Text('Authors'), body: AuthorsComponent());
  }
}

class AuthorsComponent extends HookConsumerWidget {
  const AuthorsComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> refresher =
        GlobalKey<RefreshIndicatorState>();

    final authorsProvider = ref.watch(authorsStateProvider.notifier);

    return RefreshIndicator(
      key: authorsProvider.refreshKey,
      onRefresh: () async {
        return authorsProvider.refresh();
      },
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(authorsStateProvider);
          return switch (state) {
            AuthorsStateInitial() => CustomScrollView(),
            AuthorsStateLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            AuthorsStateError(:final message) => Column(
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
                      refresher.currentState!.show();
                    },
                    child: const Text('Retry'),
                  )
                ],
              ),
            AuthorsStateLoaded(:final authors) => ResponsiveGridView<Author>(
                itemAspectRatio: singleTitleGridAspectRatio,
                items: authors,
                itemBuilder: (author) {
                  return CoverItem(
                    onTap: () async {
                      router.pushId(author.id, extra: author.name);
                    },
                    thumbnailUrl: author.artPath,
                    title: author.name,
                    icon: CupertinoIcons.person_2_fill,
                    showTitle: true,
                  );
                },
              ),
          };
        },
      ),
    );
  }
}
