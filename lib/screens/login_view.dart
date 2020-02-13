import 'package:audiobookly/blocs/plex_bloc.dart';
import 'package:audiobookly/core/services/authentication_service.dart';
import 'package:audiobookly/core/viewmodels/authors_view_model.dart';
import 'package:audiobookly/core/viewmodels/login_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: '',
    );
  }
}
