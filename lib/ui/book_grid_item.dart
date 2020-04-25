import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookGridItem extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String subtitle;
  final Function onTap;
  BookGridItem({this.thumbnailUrl, this.title, this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: FractionallySizedBox(
                heightFactor: .95,
                child: CachedNetworkImage(
                  imageUrl: thumbnailUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(8.0, 2.0, 0, 1.0),
                subtitle: subtitle != null
                    ? Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                      )
                    : null,
                title: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
