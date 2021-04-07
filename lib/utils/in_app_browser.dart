import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class AudiobooklyInAppBrowser extends InAppBrowser {
  @override
  Future onLoadStart(Uri url) async {
    print("\n\nStarted $url\n\n");
  }

  @override
  Future onLoadStop(Uri url) async {
    print("\n\nStopped $url\n\n");
  }

  @override
  void onLoadError(Uri url, int code, String message) {
    print("\n\nCan't load $url.. Error: $message\n\n");
  }

  @override
  void onExit() {
    print("\n\nBrowser closed!\n\n");
  }
}

class AudiobooklyChromeSafariBrowser extends ChromeSafariBrowser {
  AudiobooklyChromeSafariBrowser(browserFallback) : super();
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

class Browser {
  ChromeSafariBrowser _browser;
  Browser([this._browser]);

  Future close() async {
    if (_browser != null)
      await _browser.close();
    else if (!kIsWeb && !Platform.isWindows && !Platform.isLinux)
      await closeWebView();
  }
}

Future<Browser> openUrl(String url) async {
  final browser = AudiobooklyChromeSafariBrowser(AudiobooklyInAppBrowser());
  if (kIsWeb || Platform.isWindows || Platform.isMacOS) {
    if (await canLaunch(url)) {
      await launch(url);
    }
    return Browser();
  } else {
    await browser.open(
      url: Uri.parse(url),
      options: ChromeSafariBrowserClassOptions(
        android: AndroidChromeCustomTabsOptions(
          addDefaultShareMenuItem: false,
        ),
        ios: IOSSafariOptions(barCollapsingEnabled: true),
      ),
    );
    return Browser(browser);
  }
}
