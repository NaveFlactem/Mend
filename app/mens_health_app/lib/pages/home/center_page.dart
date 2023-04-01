import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:mens_health_app/pages/account/account_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser;

class UserData {
  String? username;
  String? emailAddress;

  UserData({
    required this.username,
    required this.emailAddress,
  });
}

// returns the email and name
UserData getUserInfo() {
  // current user
  final user = FirebaseAuth.instance.currentUser;
  String? name;
  String? email;

  if (user != null) {
    for (final providerProfile in user.providerData) {
      // extract the name and email from providerData
      name = providerProfile.displayName;
      email = providerProfile.email;
    }
  }
  // return the data stored in a class
  return UserData(username: name, emailAddress: email);
}

//////////////////////////////////////////////////////

class CenterPage extends StatefulWidget {
  const CenterPage({Key? key}) : super(key: key);
  @override
  CenterPageState createState() => CenterPageState();
}

class CenterPageState extends State<CenterPage> {
  Widget _buildList(double h, double w) {
    return mainPage(h, w);
  }

  Container mainPage(double h, double w) {
    const String mentalChallenge =
        '''Complete both daily mental health challenges''';
    int mentalProgress = 1;
    const String physicalChallenge =
        '''Complete both daily physical health challenges''';
    int physicalProgress = 0;
    int mentalStreak = 7;
    int physicalStreak = 5;

    return Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 29, 39, 46)),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                    width: w,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        top: 100, right: 10, left: 10, bottom: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 128, 128, 128)),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 29, 39, 46)),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text('Daily Challenge Streaks',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontFamily: 'Courier'),
                                    textAlign: TextAlign.center))),
                        Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                        width: 1000,
                                        height: 1000,
                                        margin: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 15,
                                            bottom: 15),
                                        decoration: borderedBody(),
                                        child: Center(
                                            child: Text(
                                                physicalStreak.toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 50,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontFamily: 'Courier'),
                                                textAlign: TextAlign.center)))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                        width: 1000,
                                        height: 1000,
                                        margin: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 15,
                                            bottom: 15),
                                        decoration: borderedBody(),
                                        child: Center(
                                            child: Text(mentalStreak.toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 50,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontFamily: 'Courier'),
                                                textAlign: TextAlign.center))))
                              ],
                            ))
                      ],
                    ))),
            Expanded(
                flex: 1,
                child: Container(
                    width: w,
                    padding: const EdgeInsets.only(
                        top: 30, right: 10, left: 10, bottom: 10),
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 128, 128, 128)),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 29, 39, 46)),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(physicalChallenge,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: 'Courier'),
                                textAlign: TextAlign.center)),
                        Expanded(
                            flex: 1,
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 50,
                              animation: true,
                              lineHeight: 25.0,
                              animationDuration: 2000,
                              percent: physicalProgress / 2,
                              center: Text(physicalProgress.toString() + '/2',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontFamily: 'Courier'),
                                  textAlign: TextAlign.center),
                              barRadius: Radius.circular(15),
                              progressColor: Colors.greenAccent,
                            ))
                      ],
                    ))),
            Expanded(
                flex: 1,
                child: Container(
                    width: w,
                    padding: const EdgeInsets.only(
                        top: 30, right: 10, left: 10, bottom: 10),
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 128, 128, 128)),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 29, 39, 46)),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(mentalChallenge,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: 'Courier'),
                                textAlign: TextAlign.center)),
                        Expanded(
                            flex: 1,
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 50,
                              animation: true,
                              lineHeight: 25.0,
                              animationDuration: 2000,
                              percent: mentalProgress / 2,
                              center: Text(mentalProgress.toString() + '/2',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontFamily: 'Courier'),
                                  textAlign: TextAlign.center),
                              barRadius: Radius.circular(15),
                              progressColor: Colors.greenAccent,
                            ))
                      ],
                    )))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Main Page',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 205, 211, 217),
                  fontFamily: 'Courier',
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: const Color.fromARGB(255, 145, 69, 190),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                  color: const Color.fromARGB(255, 205, 211, 217),
                  height: 2.0)),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountPage()),
                );
              },
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: _buildList(newheight, width));
  }

  Decoration borderedBody() {
    return BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 128, 128, 128)),
      borderRadius: BorderRadius.circular(20),
      color: const Color.fromARGB(255, 29, 39, 46),
    );
  }
}
