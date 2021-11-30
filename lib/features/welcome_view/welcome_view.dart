import 'package:audiobookly/features/abs_login/abs_login.dart';
import 'package:audiobookly/features/auth/auth_notifier.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/features/emby_login/emby_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomeView extends HookConsumerWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider.notifier);
    final navigationService = ref.watch(navigationServiceProvider);

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
              child: const Text('Login to Plex'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                navigationService.push(
                    MaterialPageRoute(builder: (context) => const EmbyLogin()));
              },
              child: const Text('Login to Emby'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                navigationService.push(
                    MaterialPageRoute(builder: (context) => const AbsLogin()));
              },
              child: const Text('Login to Audiobookshelf'),
            ),
          ],
        ),
      ),
    );
  }
}
