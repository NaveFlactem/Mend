import 'all.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final PageController _home = PageController(initialPage: 2);

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
          Container(
            color: Colors.yellow,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 70,
                height: 70,
                child: IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
                  onPressed: () {
                    // Add your code for the button's onPressed event here
                    Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AccountPage()));
                  },
                ),
              ),
            ),
          ),
          // Physical
          const PhysicalPage(),
          // Articles
          const ArticlesPage(),
        ],
      ),
    );
  }
}