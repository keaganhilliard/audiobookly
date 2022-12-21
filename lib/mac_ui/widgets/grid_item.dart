import 'package:audiobookly/material_ui/widgets/played_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show LinearProgressIndicator, Colors;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:macos_ui/macos_ui.dart';

class GridItem extends StatelessWidget {
  final String? thumbnailUrl;
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;
  final double progress;
  final bool played;
  final bool showTitle;
  final IconData placeholder;
  final List<String>? thumbnailUrls;
  final int? index;

  const GridItem({
    Key? key,
    this.thumbnailUrl,
    this.thumbnailUrls,
    this.title,
    this.subtitle,
    this.progress = 0,
    this.onTap,
    this.played = false,
    this.placeholder = CupertinoIcons.book_solid,
    this.showTitle = false,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(8.0),
      // borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      // color: Colors.black,
      onPressed: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: MacosColors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: thumbnailUrl?.isEmpty ?? true
                      ? PlaceHolder(
                          title: showTitle ? null : title,
                          placeholder: placeholder,
                          subtitle: showTitle ? null : subtitle,
                        )
                      : CachedNetworkImage(
                          imageUrl: thumbnailUrl!,
                          memCacheWidth: 180,
                          maxWidthDiskCache: 400,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          errorWidget: (context, message, thing) => Container(
                            constraints: const BoxConstraints.expand(),
                            // color: Colors.black,
                            child: PlaceHolder(
                              title: showTitle ? null : title,
                              placeholder: placeholder,
                              subtitle: showTitle ? null : subtitle,
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            constraints: const BoxConstraints.expand(),
                            // color: Colors.black,
                            child: PlaceHolder(
                              title: showTitle ? null : title,
                              placeholder: placeholder,
                              subtitle: showTitle ? null : subtitle,
                            ),
                          ),
                        ),
                ),
              ],
            ),
            if (showTitle)
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.7,
                      child: Container(
                        height: 40,
                        //width: constraints.minWidth,
                        color: CupertinoColors.black,
                      ),
                    ),
                    Positioned(
                      width: 100,
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 11,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (progress > 0)
              Align(
                alignment: Alignment.bottomLeft,
                child: LinearProgressIndicator(
                  minHeight: 6.0,
                  value: progress,
                  backgroundColor: Colors.transparent,
                  color: Colors.deepPurple,
                ),
              ),
            if (played) const PlayedIcon(),
            if (this.index != null)
              Align(
                alignment: Alignment.topLeft,
                child: Text("$index"),
              ),
          ],
        ),
      ),
    );
  }
}

class PlaceHolder extends StatelessWidget {
  final IconData placeholder;
  final String? title;
  final String? subtitle;
  const PlaceHolder({
    Key? key,
    required this.placeholder,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MacosIcon(
          placeholder,
          size: 50.0,
        ),
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              // style: const TextStyle(fontSize: 13),
              textAlign: TextAlign.center,
              style: MacosTheme.of(context)
                  .typography
                  .title2
                  .copyWith(color: Colors.deepPurple),
            ),
          ),
        if (subtitle != null)
          Text(
            subtitle!,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: MacosTheme.of(context)
                .typography
                .title3
                .copyWith(color: MacosColors.systemGrayColor),
          )
      ],
    );
  }
}
