import 'package:audiobookly/features/auth/auth_notifier.dart';
import 'package:audiobookly/features/auth/auth_state.dart';
import 'package:audiobookly/features/offline/offline_vew.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key? key,
    required this.authorizedBuilder,
    required this.unauthorizedBuilder,
  }) : super(key: key);
  final WidgetBuilder unauthorizedBuilder;
  final WidgetBuilder authorizedBuilder;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authState = watch(authNotifierProvider);
    final navigation = watch(navigationServiceProvider);
    if (authState is AuthStateLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (authState is AuthStateLoaded) {
      return authorizedBuilder(context);
    } else if (authState is AuthStateErrorDetails) {
      print(authState.message);
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('Could not connect to server, is the device online?'),
            ),
            ElevatedButton(
              child: Text('Offline Mode'),
              onPressed: () {
                context.read(authNotifierProvider.notifier).checkToken();
                navigation
                    .push(MaterialPageRoute(builder: (context) => Offline()));
              },
            ),
            ElevatedButton(
              child: Text('Retry?'),
              onPressed: () {
                context.read(authNotifierProvider.notifier).checkToken();
              },
            )
          ],
        ),
      );
    } else {
      return unauthorizedBuilder(context);
    }
  }
}