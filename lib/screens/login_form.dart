import 'package:audiobookly/blocs/plex_bloc.dart';
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
  PlexBloc bloc;
  bool _loginFailed = false;


  void _handlePress() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (await bloc.login(username: _username, password: _password)) {
        Navigator.pop(context);
      }
      else setState(() {
        _loginFailed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<PlexBloc>(context);
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
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
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                obscureText: true,
                onSaved: (String value) {
                  _password = value;
                },
                decoration: const InputDecoration(
                    hintText: 'Enter your Plex password'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password required';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                onPressed: _handlePress,
                child: Text('Login'),
              ),
            ),
            _loginFailed ? Text('Login failed!', style: TextStyle(color: Colors.red)) : Container()
          ],
        )
      ),
    );
  }
}
