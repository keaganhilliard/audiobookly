import 'package:audiobookly/widgets/played_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoverItem extends StatelessWidget {
  const CoverItem({
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
  final Function? onTap;
  final bool played;

  // Widget imageBuilder() {
  //   return FadeInImage.memoryNetwork(image: thumbnailUrl, placeholder: ,);
  // }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        // width: MediaQuery.of(context).orientation == Orientation.portrait
        //     ? MediaQuery.of(context).size.width * 0.4
        //     : MediaQuery.of(context).size.width * 0.25,
        child: Card(
          elevation: 2.0,
          // color: Colors.black,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap as void Function()?,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl: thumbnailUrl!,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    errorWidget: (context, error, child) => Text(title ?? ''),
                    placeholder: (context, url) => Container(
                      color: Theme.of(context).canvasColor,
                      child: const Icon(
                        Icons.book,
                        size: 50.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: progress! > 0
                        ? LinearProgressIndicator(
                            minHeight: 6,
                            value: progress,
                            backgroundColor: Colors.transparent,
                          )
                        : Container(),
                  ),
                ),
                if (played) const PlayedIcon(),
              ],
            ),
          ),
        ));
  }
}
