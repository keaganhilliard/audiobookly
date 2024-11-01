import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:audiobookly/domain/settings/settings_notifier.dart';
import 'package:audiobookly/domain/settings/settings_state.dart';
import 'package:audiobookly/ios_ui/features/home/home.dart';
import 'package:audiobookly/ios_ui/widgets/sidebar_button.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final state = ref.watch(settingsStateProvider);
    final auth = ref.watch(authNotifierProvider.notifier);
    final prefs = ref.watch(preferencesProvider);
    // if (state is SettingsStateInitial) Future.value(settings.getUser());
    return switch (state) {
      SettingsStateInitial() || SettingsStateLoading() => const Center(
          child: CupertinoActivityIndicator(
            radius: 40,
          ),
        ),
      SettingsStateLoaded(:final user) => ListView(
          children: [
            if (!ref.watch(showSidebarProvider))
              const Align(
                alignment: Alignment.centerLeft,
                child: SidebarButton(),
              ),
            CupertinoListTile(
              title: const Text('Account'),
              subtitle: Text(user!.userName!),
              trailing: user.thumb != null
                  ? Image.network(
                      user.thumb!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, exception, stackTrace) =>
                          const Icon(CupertinoIcons.person_fill),
                    )
                  : const Icon(CupertinoIcons.person_fill),
            ),
            CupertinoListTile(
              title: const Text("Library"),
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
        ),
      SettingsStateError(:final message) => Center(
          child: Text(message!),
        ),
    };
  }
}
