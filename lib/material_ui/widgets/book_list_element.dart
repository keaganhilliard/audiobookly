import 'package:audiobookly/material_ui/widgets/played_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookListElement extends StatelessWidget {
  const BookListElement({
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
  final Function? onTap;
  final bool played;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1 / 1.4,
        child: Card(
          elevation: 2.0,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap as void Function()?,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    progress! > 0
                        ? LinearProgressIndicator(
                            minHeight: 8,
                            value: progress,
                            backgroundColor: Colors.transparent,
                          )
                        : Container(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: FractionallySizedBox(
                        heightFactor: .95,
                        child: CachedNetworkImage(
                          imageUrl: thumbnailUrl!,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          errorWidget: (context, error, child) =>
                              Text(title ?? ''),
                          placeholder: (context, url) => Container(
                            color: Theme.of(context).canvasColor,
                            child: const Icon(
                              Icons.book,
                              size: 50.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),
                            if (subtitle != null)
                              Text(
                                subtitle!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[400],
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (played) const PlayedIcon(),
              ],
            ),
          ),
        ));
  }
}
