import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:audiobookly/domain/settings/settings_notifier.dart';
import 'package:audiobookly/domain/settings/settings_state.dart';
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
            title: const Text('About Audiobookly'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Audiobookly',
                applicationVersion: '0.1.0',
                applicationIcon: Image.asset(
                  'assets/audiobookly_icon.png',
                  height: 50.0,
                ),
                useRootNavigator: true,
              );
            },
          ),
          ListTile(
            title: const Text('Account'),
            subtitle: Text(state.user!.userName!),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('Logout'),
              onPressed: () async {
                await auth.logout();
              },
            ),
          )
        ],
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
