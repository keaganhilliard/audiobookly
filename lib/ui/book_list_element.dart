import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookListElement extends StatelessWidget {
  BookListElement({
    this.progress,
    this.subTitle,
    this.title,
    this.thumbnailUrl,
    this.width,
    this.height,
    this.onTap,
  });

  final double progress;
  final Widget title;
  final Widget subTitle;
  final String thumbnailUrl;
  final double width;
  final double height;
  final Function onTap;

  // Widget imageBuilder() {
  //   return FadeInImage.memoryNetwork(image: thumbnailUrl, placeholder: ,);
  // }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1 / 1.4,
        // width: MediaQuery.of(context).orientation == Orientation.portrait
        //     ? MediaQuery.of(context).size.width * 0.4
        //     : MediaQuery.of(context).size.width * 0.25,
        child: Card(
          color: Colors.black,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  progress > 0
                      ? LinearProgressIndicator(
                          value: progress,
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
                      child: !kIsWeb && Platform.isWindows
                          ? Image.network(thumbnailUrl,
                              fit: BoxFit.cover, alignment: Alignment.center,
                              frameBuilder: (context, child, frame,
                                  wasSynchronouslyLoaded) {
                              return wasSynchronouslyLoaded || frame != null
                                  ? child
                                  : Container(
                                      color: Theme.of(context).canvasColor,
                                      child: Icon(
                                        Icons.book,
                                        size: 50.0,
                                      ),
                                    );
                            })
                          : CachedNetworkImage(
                              imageUrl: thumbnailUrl,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              errorWidget: (context, message, thing) =>
                                  Text(message),
                              placeholder: (context, url) => Container(
                                color: Theme.of(context).canvasColor,
                                child: Icon(
                                  Icons.book,
                                  size: 50.0,
                                ),
                              ),
                            ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 0, 1.0),
                      subtitle: subTitle,
                      title: title,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
