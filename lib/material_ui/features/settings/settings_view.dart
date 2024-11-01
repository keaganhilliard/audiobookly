import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:audiobookly/domain/settings/settings_notifier.dart';
import 'package:audiobookly/material_ui/features/library_select/library_select_view.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/router.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final state = ref.watch(settingsStateProvider);
    final prefs = ref.watch(preferencesProvider);
    final prefsNotifier = ref.watch(preferencesProvider.notifier);
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
                    applicationIcon: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Image.asset(
                        'assets/new_ab_icon.png',
                        height: 50.0,
                      ),
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
              SwitchListTile.adaptive(
                title: const Text('Use Chapter Progress Bar'),
                value: prefs.useChapterProgressBar,
                onChanged: (value) => prefsNotifier.savePreferences(
                    prefs.copyWith(useChapterProgressBar: value)),
              ),
              ListTile(
                title: const Text('Library'),
                subtitle: Text(
                  prefs.libraryLabel.isEmpty
                      ? prefs.libraryId
                      : prefs.libraryLabel,
                ),
                onTap: () {
                  context.push(Routes.selectLibrary.path);
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
