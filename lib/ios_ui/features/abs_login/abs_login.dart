import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
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
    final invalidLogin = useState(false);
    final login =
        useState(LoginState()..baseUrl = ref.read(preferencesProvider).baseUrl);
    final auth = ref.watch(authNotifierProvider.notifier);
    final navigationService = ref.watch(navigationServiceProvider);
    final usernameController = useTextEditingController();
    final baseUrlController =
        useTextEditingController(text: ref.read(preferencesProvider).baseUrl);
    final passwordController = useTextEditingController();

    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 100.0, bottom: 32.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 36.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CupertinoTextFormFieldRow(
                    autocorrect: false,
                    placeholder: 'Server Url',
                    controller: baseUrlController,
                    key: const ValueKey('abs-url-field'),
                    onChanged: (val) {
                      login.value.baseUrl = val;
                    },
                    validator: (val) =>
                        val!.isEmpty ? "Please enter your server's url" : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CupertinoTextFormFieldRow(
                    autocorrect: false,
                    placeholder: 'Username',
                    controller: usernameController,
                    key: const ValueKey('username-field'),
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter a username' : null,
                    onChanged: (val) {
                      login.value.username = val;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CupertinoTextFormFieldRow(
                    autocorrect: false,
                    placeholder: 'Password',
                    controller: passwordController,
                    key: const ValueKey('password-field'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a password' : null,
                    onChanged: (val) {
                      login.value.password = val;
                    },
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: invalidLogin.value
                            ? const Text(
                                'Login failed please try again',
                                softWrap: true,
                                style: TextStyle(
                                  color: CupertinoColors.destructiveRed,
                                ),
                              )
                            : null,
                      ),
                      CupertinoButton(
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.deepPurple,
                        child: loading.value
                            ? const CupertinoActivityIndicator()
                            : const Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            invalidLogin.value = false;
                            loading.value = true;
                            if (!await auth.absLogin(
                              login.value.baseUrl,
                              login.value.username,
                              login.value.password,
                            )) {
                              invalidLogin.value = true;
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //         content: Text(
                              //             'Username or password invalid')));
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
