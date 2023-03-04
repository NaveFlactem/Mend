import 'all.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  FriendsPageState createState() => FriendsPageState();
}

class FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          //Friends
          Container(
            color: Colors.blue,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
        ],
      ),
    );
  }
}
