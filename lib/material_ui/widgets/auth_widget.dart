import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key? key,
    required this.authorizedBuilder,
    required this.unauthorizedBuilder,
    required this.loadingBuilder,
    required this.errorBuilder,
  }) : super(key: key);
  final WidgetBuilder unauthorizedBuilder;
  final WidgetBuilder authorizedBuilder;
  final WidgetBuilder loadingBuilder;
  final Widget Function(BuildContext, String?) errorBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return authState.when<Widget>(
        initial: () => unauthorizedBuilder(context),
        loaded: (user) => authorizedBuilder(context),
        loading: () => loadingBuilder(context),
        error: (error) => errorBuilder(context, error),
        offline: () => Container());
  }
}
