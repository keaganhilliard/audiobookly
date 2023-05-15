import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginState {
  late String username;
  late String baseUrl;
  late String password;
}

class AbsLogin extends HookConsumerWidget {
  const AbsLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final loading = useState(false);
    final login =
        useState(LoginState()..baseUrl = ref.read(preferencesProvider).baseUrl);
    final auth = ref.watch(authNotifierProvider.notifier);
    final navigationService = ref.watch(navigationServiceProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 100.0, bottom: 32.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    key: const ValueKey('abs-url-field'),
                    initialValue: ref.read(preferencesProvider).baseUrl,
                    onChanged: (val) {
                      login.value.baseUrl = val;
                    },
                    validator: (val) =>
                        val!.isEmpty ? "Please enter your server's url" : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Audiobookshelf Server Url',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    key: const ValueKey('username-field'),
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter a username' : null,
                    onChanged: (val) {
                      login.value.username = val;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    key: const ValueKey('password-field'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a password' : null,
                    onChanged: (val) {
                      login.value.password = val;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromRGBO(161, 133, 67, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: loading.value
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                )
                              : const Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                        ),
                        onPressed: () async {
                          final messenger = ScaffoldMessenger.of(context);
                          if (formKey.currentState!.validate()) {
                            loading.value = true;
                            if (!await auth.absLogin(
                              login.value.baseUrl,
                              login.value.username,
                              login.value.password,
                            )) {
                              messenger.showSnackBar(const SnackBar(
                                  content:
                                      Text('Username or password invalid')));
                            } else {
                              await auth.checkToken();
                              navigationService.pop();
                            }
                            loading.value = false;
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
