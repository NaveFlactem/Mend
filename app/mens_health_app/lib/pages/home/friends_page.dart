import 'package:flutter/material.dart';

class Friend {
  String username;
  Widget profilePicture;
  bool push;

  Friend({
    required this.username,
    required this.profilePicture,
    required this.push,
  });
}

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);
  @override
  FriendsPageState createState() => FriendsPageState();
}

class FriendsPageState extends State<FriendsPage> {
  List<Friend> friends = [
    Friend(
      username: 'John',
      profilePicture: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      push: true,
    ),
    Friend(
      username: 'Mary',
      profilePicture: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      push: false,
    ),
    Friend(
      username: 'Bob',
      profilePicture: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      push: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 41, 82),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Expanded(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              const Flexible(
                flex: 3,
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
              const Flexible(
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
        ),
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          Friend friend = friends[index];
          return ListTile(
            leading: friend.profilePicture,
            title: Text(friend.username),
            trailing: friend.push
                ? const Icon(
                    Icons.notifications,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.notifications_off,
                    color: Colors.red,
                  ),
          );
        },
      ),
    );
  }
}
