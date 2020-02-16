import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/utils/plex_search_delegate.dart';
import 'package:audiobookly/core/viewmodels/root_view_model.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/ui/router.dart';
import 'package:audiobookly/ui/now_playing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
          navigatorKey: NavigationService().navigatorKey,
          onGenerateRoute: Router.generateRoute,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
          ),
          darkTheme: ThemeData(
            accentColor: Colors.deepPurple,
            brightness: Brightness.dark,
            canvasColor: Colors.grey[900],
          ),
          home: BaseWidget<RootViewModel>(
            model: RootViewModel(),
            onModelReady: (model) => model.init(),
            builder: (context, model, child) {
              return MyHomePage(
                title: 'Audiobookly',
                model: model,
              );
            },
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.model}) : super(key: key);
  final String title;
  final RootViewModel model;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final _navigatorKey = GlobalKey<NavigatorState>();
  int _currentIndex = 0;
  bool nowPlaying = true;

  void onNavigationTap(int index) {
    if (index != _currentIndex) {
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
        case 2:
          route = Routes.Books;
          break;
        case 3:
          route = Routes.Collections;
          break;
        default:
          route = Routes.Home;
      }
      _navigatorKey.currentState.pushReplacementNamed(route);
    }
  }

  @override
  void initState() {
    super.initState();
    // getPlatformData();
  }

  @override
  Widget build(BuildContext context) {
    RootViewModel model = widget.model;

    if (model == null || model.busy) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: PlexSearchDelegate(),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: Stack(children: [
          Padding(
              padding:
                  nowPlaying ? EdgeInsets.only(bottom: 40) : EdgeInsets.only(),
              child: MultiProvider(
                providers: [
                  Provider.value(
                    value: model.server,
                  ),
                  Provider.value(
                    value: model.library,
                  ),
                ],
                child: Navigator(
                  key: _navigatorKey,
                  onGenerateRoute: Router.generateRoute,
                  initialRoute: Routes.Home,
                ),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              nowPlaying ? NowPlaying() : Container(),
            ],
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          currentIndex: _currentIndex,
          onTap: onNavigationTap,
          // unselectedItemColor: Theme.of(context).textTheme.title.color,
          selectedItemColor: Colors.deepPurpleAccent,
          // backgroundColor: Theme.of(context).accentColor,
          elevation: 40.0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Authors'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Books'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark),
              title: Text('Collections'),
            ),
          ],
        ),
      );
    }
  }
}
