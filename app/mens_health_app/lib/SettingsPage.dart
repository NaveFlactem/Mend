import 'all.dart';

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
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    onTap: () {
                      // navigate to About page
                    },
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
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Change Password'),
                    onTap: () {
                      // navigate to Change Password page
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