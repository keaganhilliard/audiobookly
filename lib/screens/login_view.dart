import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to Plex'),
      ),
      body: WebView(
        initialUrl: '',
      ),
    );
  }
}
