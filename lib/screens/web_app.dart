import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/cubit/authors/authors_cubit.dart';
import 'package:audiobookly/cubit/books/books_cubit.dart';
import 'package:audiobookly/ui/now_playing.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/viewmodels/root_view_model.dart';
import 'package:audiobookly/providers.dart';
// import 'package:audiobookly/repository/repository.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/ui/router.dart' as r;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class WebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // timeDilation = 7.0;
    return MaterialApp(
      title: 'Audiobookly',
      navigatorKey: NavigationService().navigatorKey,
      onGenerateRoute: r.Router.generateRoute,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        accentColor: Colors.deepPurple,
        canvasColor: Colors.grey[900],
      ),
      darkTheme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
    );
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

  final routeMap = [
    Routes.Home,
    Routes.Authors,
    Routes.Books,
    Routes.Collections,
  ];

  void onNavigationTap(int index) {
    if (index != _currentIndex) {
      String oldRoute = routeMap[_currentIndex];
      String newRoute = routeMap[index];
      setState(() {
        _currentIndex = index;
      });
      _navigatorKey.currentState
          .pushNamedAndRemoveUntil(newRoute, ModalRoute.withName(oldRoute));
    }
  }

  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(this);
    // // startAudioService();
    // connect();
    super.initState();
  }

  @override
  void dispose() {
    // disconnect();
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // void connect() async {
  //   // await AudioService.connect();
  //   PlaybackController().handleResume();
  // }

  // void disconnect() {
  //   // AudioService.disconnect();
  // }

  @override
  Widget build(BuildContext context) {
    RootViewModel model = widget.model;

    if (model == null || model.busy) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return WillPopScope(
        onWillPop: () async {
          return !await _navigatorKey.currentState.maybePop();
        },
        child: Scaffold(
          body: Row(
            children: [
              NavigationRail(
                backgroundColor: Theme.of(context).canvasColor,
                selectedIconTheme: Theme.of(context).iconTheme.copyWith(
                      color: Theme.of(context).accentColor,
                    ),
                selectedLabelTextStyle: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                selectedIndex: _currentIndex,
                onDestinationSelected: onNavigationTap,
                labelType: NavigationRailLabelType.all,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text('Authors'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.book),
                    label: Text('Books'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.collections_bookmark),
                    label: Text('Collections'),
                  ),
                ],
              ),
              VerticalDivider(thickness: 1, width: 1),
              // This is the main content.
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: MultiProvider(
                          providers: [
                            BlocProvider.value(
                              value: AuthorsCubit(model.communicator),
                            ),
                            BlocProvider.value(
                              value: BooksCubit(model.communicator),
                            ),
                            Provider.value(
                              value: model.communicator,
                            )
                          ],
                          child: Navigator(
                            key: _navigatorKey,
                            onGenerateRoute: r.Router.generateRoute,
                            initialRoute: Routes.Home,
                          ),
                        ),
                      ),
                      MultiProvider(
                          providers: [
                            StreamProvider<PlaybackState>(
                              create: (context) =>
                                  PlaybackController().playbackStateStream,
                              initialData: PlaybackState(
                                playing: false,
                              ),
                            ),
                            StreamProvider<MediaItem>(
                              create: (context) =>
                                  PlaybackController().currentMediaItemStream,
                            ),
                          ],
                          child: Consumer<PlaybackState>(
                            builder: (context, state, child) {
                              MediaItem item = Provider.of(context);
                              if (item != null &&
                                  state != null &&
                                  state.processingState !=
                                      AudioProcessingState.ready)
                                return NowPlaying();
                              else
                                return Container();
                            },
                          )),
                    ]),
              ),
            ],
          ),
        ),
      );
    }
  }
}
