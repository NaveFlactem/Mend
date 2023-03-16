import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mens_health_app/pages/account/account_page.dart';
import 'home_page.dart';

class CenterPage extends StatefulWidget {
  const CenterPage({Key? key}) : super(key: key);
  @override
  CenterPageState createState() => CenterPageState();
}

class CenterPageState extends State<CenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automacitallyImplyLeading: false,
        title: Row(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 70,
                    height: 70,
                    child: IconButton(
                      icon: const Icon(
                        Icons.account_circle,
                        size: 50,
                      ),
                      onPressed: () {
                        // Add your code for the button's onPressed event here
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AccountPage()));
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                // child: CustomScrollView(
                //   slivers: [
                //     SliverAppBar(
                //       actions: [
                //         IconButton(
                //           onPressed: signUserOut,
                //           icon: Icon(Icons.logout),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
