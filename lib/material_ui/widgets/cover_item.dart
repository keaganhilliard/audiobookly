import 'package:audiobookly/material_ui/widgets/played_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    this.icon = Icons.book,
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
    return AspectRatio(
        aspectRatio: 1,
        child: Card(
          elevation: 2.0,
          color: Colors.black,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                Positioned.fill(
                  child: thumbnailUrl == null
                      ? Container(
                          color: Colors.black,
                          child: Icon(
                            icon,
                            size: 50.0,
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: thumbnailUrl!,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          errorWidget: (context, error, child) =>
                              Text(title ?? ''),
                          placeholder: (context, url) => Container(
                            color: Colors.black,
                            child: Column(
                              children: [
                                Icon(
                                  icon,
                                  size: 50.0,
                                ),
                                Text(title ?? ''),
                              ],
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
                          ),
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
        ));
  }
}
