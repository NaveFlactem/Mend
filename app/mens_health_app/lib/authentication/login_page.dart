// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mens_health_app/pages/home/home_page.dart';
import 'account_create_page.dart';
import 'change_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //user sign in method
  void signUserIn() async {
    // show loading circle for sign in
    showDialog(
        context: context,
        builder: (context) {
          // ignore: prefer_const_constructors
          return Center(child: CircularProgressIndicator(color: Colors.purple));
        });
    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
      //stop loading circle
    } on FirebaseAuthException catch (e) {
      //stop loading circle
      Navigator.pop(context);

      //wrong email
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      }
      //wrong password
      else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  //wrong email message
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Wrong Email'),
            content: const Text('Please enter a valid email'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  //wrong password message
  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Wrong Password'),
            content: const Text('Please enter a valid password'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Center(
                child: SizedBox(
                    width: 350,
                    height: 150,
                    child: Image.asset('lib/assets/images/mend_title.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 10),
              child: TextField(
                controller: passwordController,
                style: const TextStyle(color: Colors.black),
                obscureText: true,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: ElevatedButton(
                onPressed: () {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    return;
                  } else if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    signUserIn();
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const NewPassword()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            //Spacing
            const SizedBox(
              height: 110,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountCreate()),
                    );
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
