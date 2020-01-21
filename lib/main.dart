import 'package:audiobookly/blocs/plex_bloc.dart';
import 'package:audiobookly/screens/authors.dart';
import 'package:audiobookly/screens/home.dart';
import 'package:audiobookly/screens/login_form.dart';
import 'package:flutter/material.dart';
import 'package:plex_api/plex_api.dart';
import 'package:provider/provider.dart';

PlexApi api;

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audiobookly',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
          accentColor: Colors.deepPurple, brightness: Brightness.dark),
      home: Provider(
        child: MyHomePage(title: 'Audiobookly'),
        create: (context) => PlexBloc(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  List<PlexServer> _servers = [];
  List<PlexArtist> _authors = [];
  List<PlexAlbum> _albums = [];
  int _currentIndex = 0;
  PlexApi api;

  bool _showAuthors = false;
  bool _showAlbums = false;

  void _getServers() async {
    setState(() {
      _servers = [];
      _authors = [];
      _albums = [];
      _showAuthors = false;
      _showAlbums = false;
    });
    List<PlexServer> servers = await api.getServers();
    setState(() {
      _servers = servers;
    });
  }

  void _setServer(PlexServer server) {
    api.setServer(server);
  }

  void _getArtists() async {
    List<PlexArtist> artists = await api.getArtists("4");
    setState(() {
      _showAuthors = true;
      _authors = artists;
    });
  }

  void _getAlbums(String key) async {
    List<PlexAlbum> albums = await api.getAlbums(key);
    setState(() {
      _showAlbums = true;
      _albums = albums;
    });
  }

  void _goBack() {
    setState(() {
      _showAlbums = false;
      _albums = [];
    });
  }

  Widget getImage(int position) {
    String url;
    if (_showAlbums)
      url =
          'http://${api.server.address}:${api.server.port}${_albums[position].thumb}?X-Plex-Token=${api.server.accessToken}';
    if (_showAuthors)
      url =
          'http://${api.server.address}:${api.server.port}${_authors[position].thumb}?X-Plex-Token=${api.server.accessToken}';
    return url != null ? Image.network(url) : Text("Nothing to see here");
  }

  void onNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> tabs = [Home(), Authors(), Home(), Home()];

  bool built = false;

  @override
  Widget build(BuildContext context) {
    if (!built) {
      () async {
        if (api == null) {
          setState(() {
            built = true;
          });
          PlexBloc plexBloc = Provider.of<PlexBloc>(context);
          if (await plexBloc.connect()) {
            api = plexBloc.connection;
          } else {
            Navigator.push(
                context,
                MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return Provider(
                      child: Scaffold(
                        appBar: AppBar(
                          title: Text('Login to Plex'),
                        ),
                        body: LoginForm(),
                      ),
                      create: (context) => plexBloc,
                    );
                  },
                  fullscreenDialog: true,
                ));
          }
        }
      }();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(children: [
        Padding(padding: EdgeInsets.only(bottom: 40), child: tabs[_currentIndex]),
        Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                  color: Theme.of(context).accentColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Now Playing')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.play_arrow),
                            iconSize: 20,
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            autofocus: false,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            iconSize: 20,
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, right: 10),
                            autofocus: false,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ],
                  ),
                  borderOnForeground: true,
                  elevation: 20)
            ]),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onNavigationTap,
        selectedItemColor: Theme.of(context).accentColor,
        elevation: 15,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Authors')),
          BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('Books')),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark),
              title: Text('Collections')),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _getServers,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.adb),
      // ),
    );
  }
}

/**
 * ListView.builder(
        shrinkWrap: false,
        padding: EdgeInsets.all(8.0),
        itemCount: _showAlbums
            ? _albums.length
            : _showAuthors ? _authors.length : _servers.length,
        itemBuilder: (context, position) {
          return new Card(
              child: InkWell(
            onTap: () {
              if (_showAlbums) {}
              if (_showAuthors) {
                _getAlbums(_authors[position].ratingKey);
              } else {
                _setServer(_servers[position]);
                _getArtists();
              }
            },
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${_showAlbums ? _albums[position].title : _showAuthors ? _authors[position].title : _servers[position].name}',
                  ),
                  getImage(position)
                ],
              ),
            ),
          ));
        },
      )
 */
