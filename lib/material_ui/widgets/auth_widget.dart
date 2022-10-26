import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:audiobookly/domain/auth/auth_state.dart';
import 'package:audiobookly/material_ui/features/offline/offline_view.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
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
    final navigation = ref.watch(navigationServiceProvider);

    return authState.when<Widget>(
        initial: () => unauthorizedBuilder(context),
        loaded: (user) => authorizedBuilder(context),
        loading: () => loadingBuilder(context),
        error: (error) => errorBuilder(context, error),
        offline: () => Container());
  }
}
