// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountCreate extends StatefulWidget {
  const AccountCreate({Key? key}) : super(key: key);

  @override
  AccountCreateState createState() => AccountCreateState();
}

class AccountCreateState extends State<AccountCreate> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Function to create a new user with email verification and add them to the list of users
  Future<void> createUser(String email, String password) async {
    // Check if the email is already in use
    final bool isEmailTaken = await _isEmailTaken(email);
    if (isEmailTaken) {
      throw FirebaseException(
        code: 'email-already-in-use',
        message: 'The email address is already in use.',
        plugin: 'createUser',
      );
    }

    // Create user account using Firebase Authentication
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Send email verification to the new user
    await userCredential.user!.sendEmailVerification();

    // Get the current user's ID
    String userId = FirebaseAuth.instance.currentUser!.uid;

    final firestoreinstance = FirebaseFirestore.instance;
    // Create a new user document in the "users" collection
    await FirebaseFirestore.instance.collection('users').doc(email).set({
      'email': email,
      'password': password,
      'user id': userId,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Function to check if an email is already in use
  Future<bool> _isEmailTaken(String email) async {
    final result =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    return result.isNotEmpty;
  }

  void signUpUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.purple));
        });

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && !currentUser.emailVerified) {
        currentUser.sendEmailVerification();
        emailNotVerifiedMessage();
      } else {
        createUser(emailController.text, passwordController.text);
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'weak-password') {
        weakPasswordMessage();
      } else if (e.code == 'email-already-in-use') {
        emailAlreadyInUseMessage();
      }
    }
  }

  void emailNotVerifiedMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Email not verified'),
          content: const Text(
              'You need to verify your email before logging in. Please check your inbox and follow the instructions in the email.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void weakPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Weak Password'),
            content: const Text('The password provided is too weak.'),
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

  void emailAlreadyInUseMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Email Already In Use'),
            content: const Text('The email provided is already in use.'),
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
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: confirmPasswordController,
                style: const TextStyle(color: Colors.black),
                obscureText: true,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 100),
              child: SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    if (passwordController.text ==
                            confirmPasswordController.text &&
                        emailController.text != '' &&
                        passwordController.text != '' &&
                        confirmPasswordController.text != '') {
                      signUpUser();
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Passwords do not match'),
                              content: const Text('Please try again.'),
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
                    } else if (emailController.text == '' ||
                        passwordController.text == '' ||
                        confirmPasswordController.text == '') {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Please fill out all fields'),
                              content: const Text('Please try again.'),
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
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already a member?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    'Login',
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
