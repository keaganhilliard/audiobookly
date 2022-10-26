import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:audiobookly/domain/settings/settings_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(settingsStateProvider);
    final auth = ref.watch(authNotifierProvider.notifier);
    // if (state is SettingsStateInitial) Future.value(settings.getUser());
    return state.when(
        initial: () => const Center(
                child: CupertinoActivityIndicator(
              radius: 40,
            )),
        loading: () => const Center(
                child: CupertinoActivityIndicator(
              radius: 40,
            )),
        loaded: (user) {
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
                    : const Icon(CupertinoIcons.person_fill),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoButton.filled(
                  child: const Text('Logout'),
                  onPressed: () async {
                    await auth.logout();
                  },
                ),
              )
              // CupertinoListTile(
              //   title: const Text('About'),
              //   onTap: () {
              //     showAboutDialog(
              //       context: context,
              //       applicationName: 'Audiobookly',
              //       applicationVersion: '1.0.0',
              //       applicationIcon: Image.asset(
              //         'assets/audiobookly_launcher_round.png',
              //         height: 50.0,
              //       ),
              //       useRootNavigator: true,
              //     );
              //   },
              // ),
            ],
          );
        },
        error: (message) => Center(
              child: Text(message!),
            ));
  }
}
