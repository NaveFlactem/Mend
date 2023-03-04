import 'all.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  final PageController _profile = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _profile,
        children: [
          //Settings
          Container(
            color: Colors.blue,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
          //Profile
          Container(
            color: Colors.green,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
          //History
          Container(
            color: Colors.yellow,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
        ],
      ),
    );
  }
}
