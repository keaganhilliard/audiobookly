import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:audiobookly/domain/settings/settings_notifier.dart';
import 'package:audiobookly/ios_ui/features/library_select/library_select_view.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
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
    final prefs = ref.watch(preferencesProvider);
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
        loaded: (user, library) {
          return ListView(
            children: [
              CupertinoListTile(
                title: const Text('Account'),
                subtitle: Text(user!.userName!),
                trailing: user.thumb != null
                    ? Image.network(
                        user.thumb!,
                        fit: BoxFit.contain,
                        errorBuilder: (context, exception, stackTrace) {
                          return Container();
                        },
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
                  ref.read(navigationServiceProvider).push(
                        CupertinoPageRoute(
                          builder: (context) => const IosLibrarySelectView(),
                        ),
                      );
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
          );
        },
        error: (message) => Center(
              child: Text(message!),
            ));
  }
}
