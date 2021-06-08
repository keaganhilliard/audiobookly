import 'package:audiobookly/features/auth/auth_notifier.dart';
import 'package:audiobookly/features/settings/settings_notifier.dart';
import 'package:audiobookly/features/settings/settings_state.dart';
import 'package:cast/cast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsView extends HookWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(settingsStateProvider);
    final auth = useProvider(authNotifierProvider.notifier);
    // if (state is SettingsStateInitial) Future.value(settings.getUser());
    if (state is SettingsStateLoaded) {
      print(state.user!.name);
      return ListView(
        children: [
          ListTile(
            title: Text('Account'),
            subtitle: Text(state.user!.userName!),
            onTap: () async {
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
                : Icon(Icons.person),
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Audiobookly',
                applicationVersion: '1.0.0',
                applicationIcon:
                    Image.asset('assets/audiobookly_launcher_round.png'),
                useRootNavigator: true,
              );
            },
          ),
        ],
      );
    } else
      return Center(child: CircularProgressIndicator());
  }
}
