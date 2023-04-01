import 'package:flutter/material.dart';
import 'articles_page.dart';
import 'friends_page.dart';
import 'mental_page.dart';
import 'physical_page.dart';
import 'center_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final PageController _home = PageController(initialPage: 2);
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  //user sign out function (will be moved)
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _home,
        children: [
          // Friends
          const FriendsPage(),
          // Mental
          const MentalPage(),
          // Center page
          const CenterPage(),
          // Physical
          const PhysicalPage(),
          // Articles
          const ArticlesPage(),
        ],
      ),
    );
  }
}
