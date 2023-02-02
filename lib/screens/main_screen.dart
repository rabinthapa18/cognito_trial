import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen();

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Amplify.Auth.getCurrentUser(),
      builder: (BuildContext context, AsyncSnapshot<AuthUser> snapshot) {
        final currentUser = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: Text("Main screen"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("AWS Amplify"),
                Text("User ID ${currentUser?.userId}"),
                Text("User Name ${currentUser?.username}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
