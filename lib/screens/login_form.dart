import 'package:audiobookly/blocs/plex_bloc.dart';
import 'package:audiobookly/core/services/authentication_service.dart';
import 'package:audiobookly/core/viewmodels/authors_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _username;
  String _password;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginModel>(
      onModelReady: (model) async {
        // if (await model.checkAuth()) {
        //     Navigator.pop(context);
        // }
      },
      model: LoginModel(authenticationService: Provider.of(context)),
      child: Column(children: [
        Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextFormField(
              onSaved: (String value) {
                _username = value;
              },
              decoration: const InputDecoration(
                  hasFloatingPlaceholder: true,
                  hintText: 'Enter your Plex username'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Username required';
                }
                return null;
              },
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextFormField(
            obscureText: true,
            onSaved: (String value) {
              _password = value;
            },
            decoration:
                const InputDecoration(hintText: 'Enter your Plex password'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Password required';
              }
              return null;
            },
          ),
        )
      ]),
      builder: (contex, model, child) => Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              child,
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: model.busy
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            var loginSuccess =
                                await model.login(_username, _password);
                            if (loginSuccess) {
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: Text('Login'),
                      ),
              ),
            ],
          )),
    );
  }
}
