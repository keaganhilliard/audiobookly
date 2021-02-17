import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookGridItem extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String subtitle;
  final Function onTap;
  final double progress;
  BookGridItem({
    this.thumbnailUrl,
    this.title,
    this.subtitle,
    this.progress = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            if (progress > 0)
              Align(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator(
                  value: progress,
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
                    child:
                        /*!kIsWeb && Platform.isWindows
                        ? Image.network(thumbnailUrl,
                            errorBuilder: (context, exception, stackTrace) {
                              return Container(
                                constraints: BoxConstraints.expand(),
                                color: Colors.black,
                                child: Icon(
                                  subtitle == null ? Icons.person : Icons.book,
                                  size: 50.0,
                                ),
                              );
                            },
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
                              return wasSynchronouslyLoaded || frame != null
                                  ? child
                                  : Container(
                                      constraints: BoxConstraints.expand(),
                                      color: Colors.black,
                                      child: Icon(
                                        subtitle == null
                                            ? Icons.person
                                            : Icons.book,
                                        size: 50.0,
                                      ),
                                    );
                            })
                        : */
                        CachedNetworkImage(
                      imageUrl: thumbnailUrl,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      errorWidget: (context, message, thing) => Container(
                        constraints: BoxConstraints.expand(),
                        color: Colors.black,
                        child: Icon(
                          subtitle == null ? Icons.person : Icons.book,
                          size: 50.0,
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        constraints: BoxConstraints.expand(),
                        color: Colors.black,
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
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13),
                        ),
                        if (subtitle != null)
                          Text(
                            subtitle,
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
          ],
        ),
      ),
    );
  }
}
