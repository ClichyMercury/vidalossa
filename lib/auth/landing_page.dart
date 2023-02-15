import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidalossa/auth/appState.dart';
import 'package:vidalossa/screens/SplashScreen/Splash_Screen.dart';
import 'package:vidalossa/screens/connection/connection_page.dart';
import 'package:vidalossa/screens/root/root.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return ConnectionPage();
          }
          return const BaseApp();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        }
        return Scaffold(
            body: Center(
          child: Text(" No Connection"),
        ));
      }),
    );
  }
}
