import 'package:flutter/material.dart';
import 'package:plex_api/plex_api.dart';

PlexApi api;

void main() async {
  api = PlexApi(headers: PlexHeaders(clientIdentifier: "Audibookly"));
  await api.authenticate("");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
          accentColor: Colors.deepPurple, brightness: Brightness.dark),
      home: MyHomePage(title: 'Audiobookly'),
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
    if (_showAlbums) url = 'http://${api.server.address}:${api.server.port}${_albums[position].thumb}?X-Plex-Token=${api.server.accessToken}';
    if (_showAuthors) url = 'http://${api.server.address}:${api.server.port}${_authors[position].thumb}?X-Plex-Token=${api.server.accessToken}';
    return url != null ? Image.network(url) : Text("Nothing to see here");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: _showAlbums,
        title: Text(widget.title),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: _goBack),
      ),
      body: ListView.builder(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getServers,
        tooltip: 'Increment',
        child: Icon(Icons.adb),
      ),
    );
  }
}
