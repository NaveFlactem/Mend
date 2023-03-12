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
            child: const CustomScrollView(
              slivers: [],
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
