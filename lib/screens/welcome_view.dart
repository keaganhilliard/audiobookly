// import 'package:audiobookly/core/services/navigation_service.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onLoadStart(String url) async {
    print("\n\nStarted $url\n\n");
  }

  @override
  Future onLoadStop(String url) async {
    print("\n\nStopped $url\n\n");
  }

  @override
  void onLoadError(String url, int code, String message) {
    print("\n\nCan't load $url.. Error: $message\n\n");
  }

  @override
  void onExit() {
    print("\n\nBrowser closed!\n\n");
  }
}

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  MyChromeSafariBrowser(browserFallback) : super(bFallback: browserFallback);
  Completer closed;

  @override
  void onOpened() {
    closed = Completer();
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    closed.complete();
    print("ChromeSafari browser closed");
  }
}

class WelcomeView extends StatefulWidget {
  final ChromeSafariBrowser browser = MyChromeSafariBrowser(MyInAppBrowser());

  final String url;

  WelcomeView({this.url});

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Audiobookly'),
      ),
      body: Center(
        child: RaisedButton(
            color: Colors.amber,
            onPressed: () async {
              if (kIsWeb || Platform.isWindows || Platform.isMacOS) {
                if (await canLaunch(widget.url)) {
                  launch(widget.url);
                }
              } else {
                await widget.browser.open(
                  url: widget.url,
                  options: ChromeSafariBrowserClassOptions(
                    android: AndroidChromeCustomTabsOptions(
                      addDefaultShareMenuItem: false,
                    ),
                    ios: IOSSafariOptions(barCollapsingEnabled: true),
                  ),
                );
              }
            },
            child: Text('Login to Plex')),
      ),
    );
  }
}
