import 'package:audiobookly/ios_ui/features/book_details/book_details_view.dart';
import 'package:audiobookly/ios_ui/features/books/books_view.dart';
import 'package:audiobookly/models/author.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/model_union.dart';
import 'package:audiobookly/models/series.dart';
import 'package:flutter/cupertino.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/material.dart' show LinearProgressIndicator, Colors;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/played_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeRow extends HookConsumerWidget {
  final String? title;
  final List<ModelUnion> items;
  final double? height;
  HomeRow({super.key, this.title, required this.items, this.height});
  final debouncer = Debouncer(milliseconds: 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = useState(PageController(viewportFraction: 0.588));
    return LayoutBuilder(builder: (context, constraints) {
      debouncer.run(() {
        if (pageController.value.viewportFraction !=
            250 / constraints.maxWidth) {
          pageController.value =
              PageController(viewportFraction: 250 / constraints.maxWidth);
        }
      });
      return HookBuilder(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 8.0),
                child: Text(
                  title!,
                  style: const TextStyle(fontSize: 24),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: SizedBox(
                height: height,
                child: PageView.builder(
                  clipBehavior: Clip.antiAlias,
                  controller: pageController.value,
                  pageSnapping: false,
                  padEnds: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) => switch (items[index]) {
                    BookValue(
                      value: Book(
                        :final id,
                        :final progress,
                        :final artPath,
                        :final read,
                        :final author,
                      )
                    ) =>
                      CoverItem(
                        onTap: () async {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) {
                                return BookDetailsView(mediaId: id);
                              },
                            ),
                          );
                        },
                        height: height,
                        progress: progress,
                        thumbnailUrl: artPath,
                        title: title,
                        subtitle: author,
                        played: read,
                      ),
                    AuthorValue(
                      value: Author(
                        :final id,
                        :final name,
                        :final artPath,
                      )
                    ) =>
                      CoverItem(
                        onTap: () async {
                          Navigator.of(context)
                              .push(CupertinoPageRoute(builder: (context) {
                            return BooksView(
                              mediaId: id,
                              title: name,
                            );
                          }));
                        },
                        height: height,
                        thumbnailUrl: artPath,
                        title: name,
                        icon: CupertinoIcons.person_2_fill,
                        showTitle: true,
                      ),
                    SeriesValue(
                      value: Series(
                        :final id,
                        :final name,
                        :final artPath,
                      )
                    ) =>
                      CoverItem(
                        onTap: () async {
                          Navigator.of(context)
                              .push(CupertinoPageRoute(builder: (context) {
                            return BooksView(
                              mediaId: id,
                              title: name,
                            );
                          }));
                        },
                        height: height,
                        thumbnailUrl: artPath,
                        title: name,
                        icon: CupertinoIcons.person_2_fill,
                        showTitle: true,
                      ),
                    _ => const CoverItem(
                        title: 'Good God we have a problem',
                      ),
                  },
                ),
              ),
            ),
          ],
        );
      });
    });
  }
}

class CoverItem extends StatelessWidget {
  const CoverItem({
    super.key,
    this.progress = 0,
    this.subtitle,
    this.title,
    this.thumbnailUrl,
    this.width,
    this.height,
    this.onTap,
    this.played = false,
    this.icon = CupertinoIcons.book_fill,
    this.showTitle = false,
  });

  final double? progress;
  final String? title;
  final String? subtitle;
  final String? thumbnailUrl;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final bool played;
  final IconData icon;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: CupertinoButton(
          padding: const EdgeInsets.all(0.0),
          onPressed: onTap,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.black,
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned.fill(
                  child: thumbnailUrl == null
                      ? Container(
                          color: Colors.black,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    icon,
                                    size: 50.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: thumbnailUrl!,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          errorWidget: (context, error, child) => Container(
                            color: Colors.black,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      icon,
                                      size: 50.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            color: Colors.black,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      icon,
                                      size: 50.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                if (showTitle || thumbnailUrl == null)
                  Positioned(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 45.0,
                        color: Colors.black.withOpacity(0.8),
                        child: Center(
                          child: Text(
                            title ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: progress! > 0 && !played
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: LinearProgressIndicator(
                                minHeight: 8,
                                value: progress,
                                color: Colors.deepPurple,
                                backgroundColor: Colors.grey.withOpacity(0.2),
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ),
                if (played) const PlayedIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
