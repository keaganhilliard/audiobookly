import 'package:audiobookly/features/auth/auth_notifier.dart';
import 'package:audiobookly/features/settings/settings_notifier.dart';
import 'package:audiobookly/features/settings/settings_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    if (state is SettingsStateLoaded) {
      return ListView(
        children: [
          ListTile(
            title: const Text('Account'),
            subtitle: Text(state.user!.userName!),
            onTap: () async {
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return Column(
              //         children: [
              //           TextButton(
              //             onPressed: () {},
              //             child: const Text('Add another account'),
              //           ),
              //         ],
              //       );
              //     });
              await auth.logout();
            },
            trailing: state.user!.thumb != null
                ? Image.network(
                    state.user!.thumb!,
                    fit: BoxFit.contain,
                    errorBuilder: (context, exception, stackTrace) {
                      return Container();
                    },
                  )
                : const Icon(Icons.person),
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Audiobookly',
                applicationVersion: '1.0.0',
                applicationIcon: Image.asset(
                  'assets/audiobookly_launcher_round.png',
                  height: 50.0,
                ),
                useRootNavigator: true,
              );
            },
          ),
        ],
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
