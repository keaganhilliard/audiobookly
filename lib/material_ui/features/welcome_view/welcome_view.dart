import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomeView extends HookConsumerWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Audiobookly'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     foregroundColor: Colors.white,
            //     backgroundColor: Colors.amber,
            //   ),
            //   onPressed: () async {
            //     await auth.plexLogin();
            //   },
            //   child: const Text('Login to Plex'),
            // ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     foregroundColor: Colors.white,
            //     backgroundColor: Colors.green,
            //   ),
            //   onPressed: () {
            //     navigationService.push(
            //         MaterialPageRoute(builder: (context) => const EmbyLogin()));
            //   },
            //   child: const Text('Login to Emby'),
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromRGBO(161, 133, 67, 1),
              ),
              onPressed: () {
                context.go('/login/abs');
                //       MaterialPageRoute(builder: (context) => const AbsLogin()));
              },
              child: const Text('Login to Audiobookshelf'),
            ),
          ],
        ),
      ),
    );
  }
}
