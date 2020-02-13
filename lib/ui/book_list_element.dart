import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.width * 0.4
            : MediaQuery.of(context).size.width * 0.25,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: title,
                    child: CachedNetworkImage(
                      imageUrl: thumbnailUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Center(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(8.0, 2.0, 0, 1.0),
                    subtitle: subTitle,
                    title: title,
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
