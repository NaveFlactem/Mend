import 'dart:html';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // set background color to black
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ponder', // text for "ponder"
              style: TextStyle(
                fontFamily: 'Ponder',
                fontWeight: FontWeight.w400, // set font weight to regular
                fontSize: 48.0,
                color: Colors.white,
              ),
            ),
            Text(
              'box', // text for "box"
              style: TextStyle(
                fontFamily: 'Ponder',
                fontWeight: FontWeight.w700, // set font weight to bold
                fontSize: 48.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 32.0), // add some spacing between logo and button
            ElevatedButton(
              onPressed: () {
                // TODO: add sign-in functionality
              },
              child: Text(
                'Sign In', // text for sign-in button
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainAxisAlignment {}
