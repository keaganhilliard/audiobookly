import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/aspect_ratios.dart';
import 'package:audiobookly/domain/series/series_notifier.dart';
import 'package:audiobookly/domain/series/series_state.dart';
import 'package:audiobookly/material_ui/widgets/ab_error_widget.dart';
import 'package:audiobookly/material_ui/widgets/cover_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:audiobookly/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';

class SeriesView extends HookConsumerWidget {
  const SeriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seriesProvider = ref.watch(seriesStateProvider.notifier);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      onRefresh: () {
        seriesProvider.refresh();
      },
      title: const Text('Series'),
      body: SeriesComponent(),
    );
  }
}

class SeriesComponent extends HookConsumerWidget {
  const SeriesComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> refresher =
        GlobalKey<RefreshIndicatorState>();

    final seriesProvider = ref.watch(seriesStateProvider.notifier);

    return RefreshIndicator(
      key: refresher,
      onRefresh: () async {
        return seriesProvider.refresh();
      },
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(seriesStateProvider);
          switch (state) {
            case SeriesStateInitial():
              refresher.currentState?.show();
            case SeriesStateLoaded(:final series):
              return ResponsiveGridView<MediaItem>(
                itemAspectRatio: singleTitleGridAspectRatio,
                items: series,
                itemBuilder: (serie) {
                  return CoverItem(
                    onTap: () {
                      router.pushId(serie.id, extra: serie.title);
                    },
                    thumbnailUrl: serie.artUri?.toString(),
                    title: serie.title,
                    icon:
                        CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
                    showTitle: true,
                  );
                },
              );
            case SeriesStateErrorDetails(:final message):
              return ABErrorWidget(
                message: message,
                retry: () {
                  refresher.currentState!.show();
                },
              );
          }
          return CustomScrollView();
        },
      ),
    );
  }
}
