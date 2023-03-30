import 'package:flutter/material.dart';
import 'change_password_page.dart';
import 'change_username_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool _isNotificationOn = false;

  void _toggleNotification() {
    setState(() {
      _isNotificationOn = !_isNotificationOn;
    });
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('About Us'),
          content: Container(
            width: double.maxFinite,
            child: Text(
              'This app was made as a part of the Google DSC program at UCSC. It was designed to help men mangage and improve their physical and mental health. We hope you enjoy!',
            ),
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          //Settings
          Container(
            color: Color.fromARGB(255, 69, 69, 69),
            child: Container(
              padding: const EdgeInsets.all(0.5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 172, 172, 172),
                borderRadius: BorderRadius.circular(0.0),
                border: Border.all(
                  color: Color.fromARGB(255, 69, 69, 69),
                  width: 20.0,
                ),
              ),
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notifications'),
                    trailing: Switch(
                      value: _isNotificationOn,
                      onChanged: (value) {
                        _toggleNotification();
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Personalization'),
                    onTap: () {
                      // navigate to Personalization page
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Change Username'),
                    onTap: () {
                      // navigate to Change Username page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeUserNamePage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Change Password'),
                    onTap: () {
                      // navigate to Change Password page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePasswordPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    onTap: () {
                      _showAboutDialog(); // show the about dialog
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('Credits'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Credits'),
                            content: Container(
                              width: double.maxFinite,
                              child: Text(
                                'This app was created by Thomas Pollicino, Ryan Taylor, Alfonso Luis Del Rosario, Cristian Rivas, Salad, Vish, Open AI, and Evan Metcalf as part of the Google DSC program at UCSC.',
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.wallet,
                        color: Color.fromARGB(255, 172, 172,
                            172)), // Set the color of the icon to green
                    title: Text('       '),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Easter Egg'),
                            content: Image.asset('asset/images/IMG_5051.jpg'),
                            actions: [
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.wallet,
                        color: Color.fromARGB(255, 172, 172,
                            172)), // Set the color of the icon to green
                    title: Text('       '),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Easter Egg'),
                            content: Image.asset('asset/images/IMG_5050.jpg'),
                            actions: [
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.wallet,
                        color: Color.fromARGB(255, 172, 172,
                            172)), // Set the color of the icon to green
                    title: Text('       '),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Easter Egg'),
                            content: Image.asset('asset/images/IMG_5049.jpg'),
                            actions: [
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.wallet,
                        color: Color.fromARGB(255, 172, 172,
                            172)), // Set the color of the icon to green
                    title: Text('       '),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Easter Egg'),
                            content: Image.asset('asset/images/IMG_5076.PNG'),
                            actions: [
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.wallet,
                        color: Color.fromARGB(255, 172, 172,
                            172)), // Set the color of the icon to green
                    title: Text('       '),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Easter Egg'),
                            content: Image.asset('asset/images/IMG_5078.PNG'),
                            actions: [
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
