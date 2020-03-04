import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginView extends StatelessWidget {
  final String _url;

  LoginView({@required url}) : _url = url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to Plex'),
      ),
      body: WebView(
        initialUrl: _url,
        userAgent: "Audiobookly",
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (url) {
          print(url);
        },
      ),
    );
  }
}
