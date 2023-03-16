import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);
  @override
  FriendsPageState createState() => FriendsPageState();
}

class FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 30, 41, 82),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Row(
        children: [
          Flexible(
            flex: 4,
            child: Text(
              'Mental Health',
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 237, 171, 26),
                fontFamily: 'Courier',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              'Information',
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 237, 171, 26),
                fontFamily: 'Courier',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
