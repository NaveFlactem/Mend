import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'authentication/authentication_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('lib/assets/images/mend_loading_symbol.png',
            width: 400, height: 400),
        duration: 1500,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.black,
        nextScreen: const AuthenticatePage(),
      ),
    );
  }
}
