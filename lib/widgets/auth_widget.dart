import 'package:audiobookly/features/auth/auth_notifier.dart';
import 'package:audiobookly/features/auth/auth_state.dart';
import 'package:audiobookly/features/welcome_view/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key key,
    @required this.authorizedBuilder,
    @required this.unauthorizedBuilder,
  }) : super(key: key);
  final WidgetBuilder unauthorizedBuilder;
  final WidgetBuilder authorizedBuilder;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authState = watch(authNotifierProvider);
    if (authState is AuthStateInitial) {
      return unauthorizedBuilder(context);
    } else if (authState is AuthStateLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (authState is AuthStateLoaded) {
      print(authState.user.token);
      return authorizedBuilder(context);
    } else if (authState is AuthStateErrorDetails) {
      print(authState.message);
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(authState.message),
            ElevatedButton(
              child: Text('Log out'),
              onPressed: () {
                context.read(authNotifierProvider.notifier).logout();
              },
            )
          ],
        ),
      );
    }
  }
}
