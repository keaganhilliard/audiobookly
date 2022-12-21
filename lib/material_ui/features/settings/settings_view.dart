import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:audiobookly/domain/settings/settings_notifier.dart';
import 'package:audiobookly/domain/settings/settings_state.dart';
import 'package:audiobookly/material_ui/features/library_select/library_select_view.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(settingsStateProvider);
    final prefs = ref.watch(preferencesProvider);
    final auth = ref.watch(authNotifierProvider.notifier);
    return state.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        loaded: (user, lib) {
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
                subtitle: Text(prefs.username),
                trailing: const Icon(Icons.person),
              ),
              ListTile(
                title: const Text('Library'),
                subtitle: Text(
                  prefs.libraryLabel.isEmpty
                      ? prefs.libraryId
                      : prefs.libraryLabel,
                ),
                onTap: () {
                  ref.read(navigationServiceProvider).push(
                        MaterialPageRoute(
                          builder: (context) => const LibrarySelectView(),
                        ),
                      );
                },
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
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (message) => const Center(child: CircularProgressIndicator()));
  }
}
