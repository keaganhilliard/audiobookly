import 'package:audiobookly/widgets/played_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookListElement extends StatelessWidget {
  const BookListElement({
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
        aspectRatio: 1 / 1.4,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    progress! > 0
                        ? LinearProgressIndicator(
                            minHeight: 8,
                            value: progress,
                            // color: Theme.of(context).accentColor,
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
                      // ListTile(
                      //   contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 0, 1.0),
                      //   subtitle: subTitle,
                      //   title: title,
                      // ),
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
