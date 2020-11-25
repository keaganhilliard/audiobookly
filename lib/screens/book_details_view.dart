import 'dart:ui';

import 'package:audio_service/audio_service.dart';
// import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
// import 'package:audiobookly/core/utils/utils.dart';
import 'package:audiobookly/cubit/book_details/book_details_cubit.dart';
// import 'package:audiobookly/screens/tracks_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:marquee_widget/marquee_widget.dart';
// import 'package:audiobookly/ui/base_widget.dart';
// import 'package:audiobookly/core/viewmodels/book_view_model.dart';
import 'package:provider/provider.dart';

class BookDetailsView extends StatelessWidget {
  final MediaItem book;

  BookDetailsView({
    this.book,
  });

  @override
  Widget build(context) {
    ServerCommunicator _communicator = Provider.of(context);

    return MultiProvider(
      providers: [
        StreamProvider.value(value: AudioService.playbackStateStream),
        StreamProvider.value(value: AudioService.currentMediaItemStream),
      ],
      child: BlocProvider<BookDetailsCubit>(
        create: (context) => BookDetailsCubit(_communicator),
        child: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(book?.title ?? ''),
              ),
              body: Expanded(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: book.artUri,
                      errorWidget: (context, url, error) => Icon(Icons.book),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  IconButton getIconButton({
    Icon icon,
    Function onPressed,
    double size = 35.0,
    Color color,
  }) {
    return IconButton(
      icon: icon,
      iconSize: size,
      onPressed: onPressed,
      color: color,
    );
  }
}
