import 'dart:async';

import 'package:audiobookly/mac_ui/features/book_details/book_details_view.dart';
import 'package:audiobookly/mac_ui/features/books/books_view.dart';
import 'package:audiobookly/models/model_union.dart';
import 'package:clickup_fading_scroll/clickup_fading_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/material.dart' show LinearProgressIndicator, Colors;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/played_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:macos_ui/macos_ui.dart';

class HomeRow extends HookConsumerWidget {
  final String? title;
  final List<ModelUnion>? items;
  final double? height;
  HomeRow({super.key, this.title, this.items, this.height});
  final debouncer = Debouncer(milliseconds: 1);

  Future _handlePageMove(
      double pageMove,
      Future<void> Function({required Duration duration, required Curve curve})
          mover) async {
    for (var i = 0; i < pageMove - 1; i++) {
      await mover(
        duration: Duration(milliseconds: (300 / pageMove).floor()),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = useState(PageController(viewportFraction: 0.588));
    final pageMove = useState(1.0);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: LayoutBuilder(builder: (context, constraints) {
        debouncer.run(() {
          if (pageController.value.viewportFraction !=
              250 / constraints.maxWidth) {
            pageController.value =
                PageController(viewportFraction: 250 / constraints.maxWidth);
            pageMove.value = constraints.maxWidth / 250;
          }
        });
        return HookBuilder(builder: (context) {
          final showForwardButton = useState(false);
          final showBackButton = useState(false);
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 8.0),
                  child: Text(
                    title!,
                    style: const TextStyle(fontSize: 24),
                  )),
              MouseRegion(
                onHover: (event) {
                  if ((items?.length ?? 0) > pageMove.value) {
                    showBackButton.value = pageController.value.page != 0;
                    showForwardButton.value = true;
                  }
                },
                onExit: (event) {
                  showBackButton.value = false;
                  showForwardButton.value = false;
                },
                child: SizedBox(
                    height: height,
                    child: Stack(
                      children: [
                        FadingScroll(
                            controller: pageController.value,
                            builder: (context, scrollController) {
                              return PageView.builder(
                                clipBehavior: Clip.antiAlias,
                                controller: pageController.value,
                                pageSnapping: false,
                                padEnds: false,
                                scrollDirection: Axis.horizontal,
                                itemCount: items!.length,
                                itemBuilder: (context, index) {
                                  final ModelUnion item = items![index];

                                  return item.maybeMap(
                                    orElse: () => const CoverItem(
                                      title: 'Good God we have a problem',
                                    ),
                                    book: (book) => CoverItem(
                                      onTap: () async {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) {
                                          return BookDetailsView(
                                            mediaId: book.value.id,
                                          );
                                        }));
                                      },
                                      height: height,
                                      progress:
                                          Utils.getProgress(book: book.value),
                                      thumbnailUrl: book.value.artPath,
                                      title: book.value.title,
                                      subtitle: book.value.author,
                                      played: book.value.read,
                                    ),
                                    author: (author) => CoverItem(
                                      onTap: () async {
                                        Navigator.push(context,
                                            CupertinoPageRoute(
                                                builder: (context) {
                                          return BooksView(
                                            mediaId: author.value.id,
                                            previousPageTitle: 'Home',
                                          );
                                        }));
                                      },
                                      height: height,
                                      thumbnailUrl: author.value.artPath,
                                      title: author.value.name,
                                      progress: 0,
                                    ),
                                  );
                                },
                              );
                            }),
                        if (showBackButton.value)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              color: const Color.fromRGBO(0, 0, 0, 0.3),
                              height: height! - 10,
                              child: CupertinoButton(
                                  onPressed: () async {
                                    await _handlePageMove(
                                      pageMove.value,
                                      pageController.value.previousPage,
                                    );
                                  },
                                  child: const MacosIcon(
                                    size: 40,
                                    CupertinoIcons.back,
                                    color: MacosColors.systemGrayColor,
                                  )),
                            ),
                          ),
                        if (showForwardButton.value)
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.all(0.0),
                              color: const Color.fromRGBO(0, 0, 0, 0.3),
                              height: height! - 20,
                              child: CupertinoButton(
                                onPressed: () async {
                                  await _handlePageMove(
                                    pageMove.value,
                                    pageController.value.nextPage,
                                  );
                                },
                                child: const MacosIcon(
                                  size: 40,
                                  CupertinoIcons.forward,
                                  color: MacosColors.systemGrayColor,
                                ),
                              ),
                            ),
                          ),
                      ],
                    )),
              ),
            ],
          );
        });
      }),
    );
  }
}

class CoverItem extends StatelessWidget {
  const CoverItem({
    super.key,
    this.progress,
    this.subtitle,
    this.title,
    this.thumbnailUrl,
    this.width,
    this.height,
    this.onTap,
    this.played = false,
  });

  final double? progress;
  final String? title;
  final String? subtitle;
  final String? thumbnailUrl;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final bool played;

  // Widget imageBuilder() {
  //   return FadeInImage.memoryNetwork(image: thumbnailUrl, placeholder: ,);
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1,
        // width: MediaQuery.of(context).orientation == Orientation.portrait
        //     ? MediaQuery.of(context).size.width * 0.4
        //     : MediaQuery.of(context).size.width * 0.25,
        child: CupertinoButton(
          // color: Colors.deepPurple,
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
                                  const MacosIcon(
                                    CupertinoIcons.book_solid,
                                    size: 50.0,
                                  ),
                                  Text(
                                    title ?? '',
                                    style: MacosTheme.of(context)
                                        .typography
                                        .title2,
                                    textAlign: TextAlign.center,
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
                                    const MacosIcon(
                                      CupertinoIcons.book_solid,
                                      size: 50.0,
                                    ),
                                    Text(
                                      title ?? '',
                                      style: MacosTheme.of(context)
                                          .typography
                                          .title2,
                                      textAlign: TextAlign.center,
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
                                    const MacosIcon(
                                      CupertinoIcons.book_solid,
                                      size: 50.0,
                                    ),
                                    Text(
                                      title ?? '',
                                      style: MacosTheme.of(context)
                                          .typography
                                          .title2,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: progress! > 0 && !played
                        ? LinearProgressIndicator(
                            minHeight: 6,
                            value: progress,
                            color: Colors.deepPurple,
                            backgroundColor: Colors.transparent,
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
