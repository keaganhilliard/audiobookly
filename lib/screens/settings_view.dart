import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/library_list_view_model.dart';
import 'package:audiobookly/core/viewmodels/server_list_view_model.dart';
import 'package:audiobookly/cubit/settings/settings_cubit.dart';
import 'package:audiobookly/cubit/settings/settings_state.dart';
import 'package:audiobookly/screens/library_select.dart';
import 'package:audiobookly/screens/server_select.dart';
import 'package:audiobookly/screens/welcome_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ServerCommunicator communicator = context.watch();
    return BlocProvider.value(
      value: SettingsCubit(communicator)..getUser(),
      child: Builder(builder: (context) {
        return BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, state) {
            // if (state is BooksStateInitial) {
            //   _refresher.currentState.show();
            // }
          },
          builder: (context, state) {
            if (state is SettingsStateLoaded)
              return ListView(
                children: [
                  ListTile(
                      title: Text('Account'),
                      subtitle: Text(state.user.userName),
                      onTap: () async {
                        await context.bloc<SettingsCubit>().signOut();
                        final loginUrl = await communicator.getLoginUrl();
                        NavigationService().pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return WelcomeView(
                              url: loginUrl,
                            );
                          }),
                        );
                      },
                      trailing: Image.network(
                        state.user.thumb,
                        fit: BoxFit.contain,
                      )),
                  ListTile(
                    title: Text('About'),
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: 'Audiobookly',
                        applicationVersion: '1.0.0',
                        applicationIcon:
                            Image.asset('audiobookly_launcher_round.png'),
                        useRootNavigator: true,
                      );
                    },
                  ),
                ],
              );
            else
              return Center(child: CircularProgressIndicator());
          },
        );
      }),
    );
  }
}
