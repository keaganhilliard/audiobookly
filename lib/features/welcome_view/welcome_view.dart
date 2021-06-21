import 'package:audiobookly/features/auth/auth_notifier.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/features/emby_login/emby_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authNotifierProvider.notifier);
    final navigationService = useProvider(navigationServiceProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Audiobookly'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                onPrimary: Colors.white,
              ),
              onPressed: () async {
                await auth.plexLogin();
              },
              child: Text('Login to Plex'),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  navigationService.push(
                      MaterialPageRoute(builder: (context) => EmbyLogin()));
                },
                child: Text('Login to Emby'))
          ],
        ),
      ),
    );
  }
}
