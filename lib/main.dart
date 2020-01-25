import 'package:audiobookly/blocs/plex_bloc.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/screens/authors.dart';
import 'package:audiobookly/screens/home.dart';
import 'package:audiobookly/screens/login_form.dart';
import 'package:audiobookly/ui/router.dart';
import 'package:audiobookly/widgets/now_playing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plex_api/plex_api.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
import 'package:device_info/device_info.dart';
import 'dart:io';
import 'dart:async';
// import 'models/plex.dart';

PlexApi api;

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Audiobookly',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
          ),
          darkTheme: ThemeData(
              accentColor: Colors.deepPurple, brightness: Brightness.dark),
          home: MyHomePage(title: 'Audiobookly'),
        ));
  }
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
  final _navigatorKey = GlobalKey<NavigatorState>();
  int _currentIndex = 0;

  Future<void> getPlatformData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String authToken = preferences.getString(SharedPrefStrings.PLEX_TOKEN);
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    PlexHeaders headers;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      headers = PlexHeaders(
          clientIdentifier: androidDeviceInfo.androidId,
          device: androidDeviceInfo.model,
          product: 'Audiobookly',
          platform: 'Android',
          platformVersion: androidDeviceInfo.version.release
      );
    }

    if (authToken == null && headers != null) {
      api = PlexApi(headers: headers);
      PlexPin pin = await api.getPin();
      String oAuthUrl = api.getOauthUrl(pin.code);
      print(oAuthUrl);
      if (await urlLauncher.canLaunch(oAuthUrl)) {
        await urlLauncher.launch(oAuthUrl);
        int count = 0;
        Timer.periodic(Duration(seconds: 5), (timer) async {
          count++;
          PlexPin authToken = await api.getAuthToken(pin.id);
          if (authToken.authToken != null) {
            preferences.setString(SharedPrefStrings.PLEX_TOKEN, authToken.authToken);
            urlLauncher.closeWebView();
            timer.cancel();
          }
          print('In Timer: ${authToken.error}');
          if (count > 5) timer.cancel();
        });
      }
    }
    else if (headers != null) {
      headers.token = authToken;
      api = PlexApi(headers: headers);
      api.getServersV2().then((servers) {
        servers.where((server) => server.provides == 'server').forEach((f) => print(f.name));
      });
    }
  }

  // Widget getImage(int position) {
  //   String url;
  //   if (_showAlbums)
  //     url =
  //         'http://${api.server.address}:${api.server.port}${_albums[position].thumb}?X-Plex-Token=${api.server.accessToken}';
  //   if (_showAuthors)
  //     url =
  //         'http://${api.server.address}:${api.server.port}${_authors[position].thumb}?X-Plex-Token=${api.server.accessToken}';
  //   return url != null ? Image.network(url) : Text("Nothing to see here");
  // }

  void onNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    String route;
    switch (index) {
      case 0:
        route = Routes.Home;
        break;
      case 1:
        route = Routes.Authors;
        break;
      default:
        route = Routes.Home;
    }
    _navigatorKey.currentState.pushReplacementNamed(route);
  }

  @override
  void initState() {
    super.initState();
    getPlatformData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(children: [
        Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Navigator(
              key: _navigatorKey,
              onGenerateRoute: Router.generateRoute,
              initialRoute: Routes.Home,
            )),
        Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [NowPlaying()]),
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

// List<PlexServer> _servers = [];
// List<PlexArtist> _authors = [];
// List<PlexAlbum> _albums = [];
// int _currentIndex = 0;
// PlexApi api;

// bool _showAuthors = false;
// bool _showAlbums = false;

// void _getServers() async {
//   setState(() {
//     _servers = [];
//     _authors = [];
//     _albums = [];
//     _showAuthors = false;
//     _showAlbums = false;
//   });
//   List<PlexServer> servers = await api.getServers();
//   setState(() {
//     _servers = servers;
//   });
// }

// void _setServer(PlexServer server) {
//   api.setServer(server);
// }

// void _getArtists() async {
//   List<PlexArtist> artists = await api.getArtists("4");
//   setState(() {
//     _showAuthors = true;
//     _authors = artists;
//   });
// }

// void _getAlbums(String key) async {
//   List<PlexAlbum> albums = await api.getAllAlbums(key);
//   setState(() {
//     _showAlbums = true;
//     _albums = albums;
//   });
// }

// void _goBack() {
//   setState(() {
//     _showAlbums = false;
//     _albums = [];
//   });
// }
