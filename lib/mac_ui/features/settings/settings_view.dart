import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:audiobookly/domain/settings/settings_notifier.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(settingsStateProvider);
    final auth = ref.watch(authNotifierProvider.notifier);
    final navigationService = ref.watch(navigationServiceProvider);
    return state.when(
        initial: () => const Center(
                child: CupertinoActivityIndicator(
              radius: 40,
            )),
        loading: () => const Center(
                child: CupertinoActivityIndicator(
              radius: 40,
            )),
        loaded: (user, lib) {
          return ListView(
            children: [
              CupertinoListTile(
                title: Text(user!.userName!),
                leading: user.thumb != null
                    ? Image.network(
                        user.thumb!,
                        fit: BoxFit.contain,
                        errorBuilder: (context, exception, stackTrace) {
                          return Container();
                        },
                      )
                    : const MacosIcon(CupertinoIcons.person_fill),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PushButton(
                  buttonSize: ButtonSize.large,
                  child: const Text('Logout'),
                  onPressed: () async {
                    await auth.logout();
                    navigationService.pop();
                  },
                ),
              )
            ],
          );
        },
        error: (message) => Center(
              child: Text(message!),
            ));
  }
}
