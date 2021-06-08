import 'dart:io';

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

  BookGridItem({
    this.thumbnailUrl,
    this.title,
    this.subtitle,
    this.progress = 0,
    this.onTap,
    this.played = false,
  });

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
            if (progress > 0)
              Align(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator(
                  minHeight: 6.0,
                  value: progress,
                  backgroundColor: Theme.of(context).cardTheme.color,
                ),
              ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    child: CachedNetworkImage(
                      imageUrl: thumbnailUrl!,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      errorWidget: (context, message, thing) => Container(
                        constraints: BoxConstraints.expand(),
                        // color: Colors.black,
                        child: Icon(
                          subtitle == null ? Icons.person : Icons.book,
                          size: 50.0,
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        constraints: BoxConstraints.expand(),
                        // color: Colors.black,
                        child: Icon(
                          subtitle == null ? Icons.person : Icons.book,
                          size: 50.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13),
                        ),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey[400]),
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (played) PlayedIcon(),
          ],
        ),
      ),
    );
  }
}
