// ignore_for_file: library_private_types_in_public_api, unused_field, use_key_in_widget_constructors

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:trial_cognito/amplifyconfiguration.dart';
import 'package:trial_cognito/screens/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Amplify TODO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AmplifyTODO(),
    ),
  );
}

class AmplifyTODO extends StatefulWidget {
  const AmplifyTODO();

  @override
  _AmplifyTODOState createState() => _AmplifyTODOState();
}

class _AmplifyTODOState extends State<AmplifyTODO> {
  bool _amplifyConfigured = false;
  var _amplifyInstance = Amplify;

  Future<void> _configureAmplify() async {
    try {
      AmplifyAuthCognito auth = AmplifyAuthCognito();
      _amplifyInstance = Amplify.addPlugins([auth]) as AmplifyClass;
      await _amplifyInstance.configure(amplifyconfig);

      setState(() => _amplifyConfigured = true);
    } catch (e) {
      print(e);
      setState(() => _amplifyConfigured = false);
    }
    setState(() => _amplifyConfigured = true);
  }

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
