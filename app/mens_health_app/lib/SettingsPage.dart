import 'all.dart';
import 'all.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          //Settings
          Container(
            color: Colors.green,
            child: ListView(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
