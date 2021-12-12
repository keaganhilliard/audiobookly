import 'package:audiobookly/widgets/played_icon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookGridItem extends StatelessWidget {
  final String? thumbnailUrl;
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;
  final double progress;
  final bool played;
  final bool showTitle;
  final IconData placeholder;
  final List<String>? thumbnailUrls;

  const BookGridItem({
    Key? key,
    this.thumbnailUrl,
    this.thumbnailUrls,
    this.title,
    this.subtitle,
    this.progress = 0,
    this.onTap,
    this.played = false,
    this.placeholder = Icons.book,
    this.showTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.black,
      elevation: 1.0,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: CachedNetworkImage(
                    imageUrl: thumbnailUrl!,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    imageBuilder: (context, imageProvider) {
                      if (showTitle) {
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            return Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image(image: imageProvider),
                                Positioned(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Opacity(
                                        opacity: 0.7,
                                        child: Container(
                                          height: 40,
                                          width: constraints.minWidth,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Positioned(
                                        width: 100,
                                        child: Text(
                                          title!,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    ],
                                  ),
                                  bottom: 0,
                                  left: 0,
                                ),
                              ],
                            );
                          },
                        );
                      }
                      return Image(
                        image: imageProvider,
                      );
                    },
                    errorWidget: (context, message, thing) => Container(
                      constraints: const BoxConstraints.expand(),
                      // color: Colors.black,
                      child: PlaceHolder(
                        title: title!,
                        placeholder: placeholder,
                        subtitle: subtitle,
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      constraints: const BoxConstraints.expand(),
                      // color: Colors.black,
                      child: PlaceHolder(
                        title: title!,
                        placeholder: placeholder,
                        subtitle: subtitle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (progress > 0)
              Align(
                alignment: Alignment.bottomLeft,
                child: LinearProgressIndicator(
                  minHeight: 6.0,
                  value: progress,
                  backgroundColor: Colors.transparent,
                ),
              ),
            if (played) const PlayedIcon(),
          ],
        ),
      ),
    );
  }
}

class PlaceHolder extends StatelessWidget {
  final IconData placeholder;
  final String title;
  final String? subtitle;
  const PlaceHolder({
    Key? key,
    required this.placeholder,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          placeholder,
          size: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            // style: const TextStyle(fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ),
        if (subtitle != null)
          Text(
            subtitle!,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey[400]),
            textAlign: TextAlign.center,
          )
      ],
    );
  }
}
