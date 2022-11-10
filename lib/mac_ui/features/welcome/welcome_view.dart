import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:audiobookly/mac_ui/features/login_form/login_form_view.dart';
import 'package:audiobookly/models/preferences.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class WelcomeView extends HookConsumerWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider.notifier);
    final navigationService = ref.watch(navigationServiceProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoButton(
              color: Colors.amber,
              onPressed: () async {
                await auth.plexLogin();
              },
              child: const Text('Login to Plex'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoButton(
              color: Colors.green,
              onPressed: () {
                navigationService.push(
                  CupertinoPageRoute(
                    builder: (context) => MacosSheet(
                      child: MacosScaffold(
                        children: [
                          ContentArea(
                            builder: (context, controller) {
                              return Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MacosBackButton(
                                        fillColor: MacosColors.transparent,
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                    ),
                                  ),
                                  const LoginForm(
                                    serverType: ServerType.emby,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Login to Emby'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoButton(
              color: const Color.fromRGBO(161, 133, 67, 1),
              onPressed: () {
                navigationService.push(
                  CupertinoPageRoute(
                    builder: (context) => MacosSheet(
                      child: MacosScaffold(
                        children: [
                          ContentArea(
                            builder: (context, controller) {
                              return Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MacosBackButton(
                                        fillColor: MacosColors.transparent,
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                    ),
                                  ),
                                  const LoginForm(
                                    serverType: ServerType.audiobookshelf,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Login to Audiobookshelf'),
            ),
          ),
        ],
      ),
    );
  }
}
