import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  NewPasswordState createState() => NewPasswordState();
}

class NewPasswordState extends State<NewPassword> {
  final emailController = TextEditingController();

  void resetPassword() async {
    showDialog(
        context: context,
        builder: (context) {
          // ignore: prefer_const_constructors
          return Center(child: CircularProgressIndicator(color: Colors.purple));
        });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset email sent'),
        ),
      );

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No user found for that email'),
          ),
        );
      }
    }
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
                obscureText: false,
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
                  left: 15.0, right: 15.0, top: 15, bottom: 250),
              child: ElevatedButton(
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter your email'),
                      ),
                    );
                    return;
                  } else {
                    resetPassword();
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Return to',
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
