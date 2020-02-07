import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookListElement extends StatelessWidget {
  BookListElement(
      {this.progress,
      this.subTitle,
      this.title,
      this.thumbnailUrl,
      this.width,
      this.height});

  final double progress;
  final Widget title;
  final Widget subTitle;
  final String thumbnailUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.width * 0.4
            : MediaQuery.of(context).size.width * 0.25,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: thumbnailUrl,
                fit: BoxFit.contain,
                placeholder: (context, url) => CircularProgressIndicator(),
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(8.0, 2.0, 0, 1.0),
                subtitle: subTitle,
                title: title,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       title,
              //       subTitle,
              //     ],
              //   ),
              // ),
              progress > 0
                  ? LinearProgressIndicator(
                      value: progress,
                    )
                  : Container()
            ],
          ),
        ));
  }
}
