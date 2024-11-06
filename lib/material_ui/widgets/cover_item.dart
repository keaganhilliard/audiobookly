import 'package:audiobookly/constants/aspect_ratios.dart';
import 'package:audiobookly/material_ui/widgets/played_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    this.circle = false,
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
  final bool circle;

  @override
  Widget build(BuildContext context) {
    final ratio = subtitle?.isNotEmpty == true
        ? doubleTitleItemAspectRatio
        : singleTitleItemAspectRatio;
    return AspectRatio(
        aspectRatio: ratio,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Card(
                elevation: 2.0,
                color: Colors.black,
                clipBehavior: Clip.antiAlias,
                shape: circle ? const CircleBorder() : null,
                child: InkWell(
                  onTap: onTap,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        // alignment: Alignment.center,
                        child: thumbnailUrl == null
                            ? Container(
                                color: Colors.black,
                                child: Center(
                                  child: Icon(
                                    icon,
                                    size: 50.0,
                                  ),
                                ),
                              )
                            : CachedNetworkImage(
                                imageUrl: thumbnailUrl!,
                                fit: circle ? BoxFit.cover : BoxFit.fitHeight,
                                alignment: Alignment.center,
                                errorWidget: (context, error, child) =>
                                    Container(
                                  width: double.infinity,
                                  color: Colors.black,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        icon,
                                        size: 50.0,
                                      ),
                                      // if (!showTitle) Text(title ?? ''),
                                    ],
                                  ),
                                ),
                                placeholder: (context, url) => Container(
                                  width: double.infinity,
                                  color: Colors.black,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        icon,
                                        size: 50.0,
                                      ),
                                      // if (!showTitle) Text(title ?? ''),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      Positioned(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: progress! > 0 || played
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: LinearProgressIndicator(
                                      minHeight: 6,
                                      value: played ? 1 : progress,
                                      color: Colors.deepPurple,
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.2),
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
            Align(
              alignment: circle ? Alignment.center : Alignment.centerLeft,
              child: Padding(
                padding: circle
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.only(left: 6.0),
                child: Text(
                  title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: circle ? TextAlign.center : null,
                ),
              ),
            ),
            if (subtitle != null && subtitle!.isNotEmpty)
              Align(
                alignment: circle ? Alignment.center : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(subtitle ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey)),
                ),
              ),
          ],
        ));
  }
}
