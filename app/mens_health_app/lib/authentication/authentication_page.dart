import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:mens_health_app/pages/home/home_page.dart';

class AuthenticatePage extends StatelessWidget {
  const AuthenticatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    ));
  }
}
