import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/ios_ui/features/book_details/book_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/material.dart' show LinearProgressIndicator, Colors;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/played_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeRow extends HookConsumerWidget {
  final String? title;
  final List<MediaItem>? items;
  final double? height;
  HomeRow({super.key, this.title, this.items, this.height});
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
        // usePageController(viewportFraction: 250 / constraints.maxWidth);
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
                  itemCount: items!.length,
                  itemBuilder: (context, index) {
                    final MediaItem book = items![index];

                    return CoverItem(
                      onTap: () async {
                        Navigator.of(context)
                            .push(CupertinoPageRoute(builder: (context) {
                          return BookDetailsView(mediaId: book.id);
                        }));
                      },
                      height: height,
                      progress: Utils.getProgress(item: book),
                      thumbnailUrl: book.artUri?.toString(),
                      title: book.title,
                      subtitle: book.artist,
                      played: book.played,
                    );
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
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl: thumbnailUrl!,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    errorWidget: (context, error, child) => Text(title ?? ''),
                    placeholder: (context, url) => Container(
                      color: Colors.black,
                      child: const Icon(
                        CupertinoIcons.book_solid,
                        size: 50.0,
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
