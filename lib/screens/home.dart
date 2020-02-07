import 'package:audiobookly/ui/book_list_element.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<String> items = ['Harry Potter', 'Riyria', 'Bible'];
  final List<String> authors = ['J.K. Rowling', 'Michael J. Sullivan', 'God'];

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.only(bottom: 30.0), children: [
      Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 10, 0),
                child: Text(
                  'In Progress',
                  style: Theme.of(context).textTheme.title,
                )),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.31,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return BookListElement(
                      progress: index / 5,
                      thumbnailUrl:
                          'https://108-77-21-242.aacab1f52f6641a9bfeb29180e207e60.plex.direct:32400/library/metadata/25501/thumb/1575510058?X-Plex-Token=xYhMrWyVRMTEyUneCafk',
                      title: Text(items[index]),
                      subTitle: Text(authors[index]),
                    );
                  },
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 10, 0),
                child: Text(
                  'Recently Added',
                  style: Theme.of(context).textTheme.title,
                )),
            SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.31
                        : MediaQuery.of(context).size.height * 0.66,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return BookListElement(
                      progress: index / 10,
                      thumbnailUrl:
                          'https://108-77-21-242.aacab1f52f6641a9bfeb29180e207e60.plex.direct:32400/library/metadata/25261/thumb/1578528559?X-Plex-Token=xYhMrWyVRMTEyUneCafk',
                      title: Text(items[index]),
                      subTitle: Text(authors[index]),
                    );
                  },
                ))
          ]),
    ]);
  }
}
