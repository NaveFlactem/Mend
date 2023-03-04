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
          //Friends
          Container(
            color: Colors.blue,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
          //Mental
          Container(
            color: Colors.green,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
          // Center page
          Container(
            color: Colors.yellow,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
          //Physical
          Container(
            color: Colors.orange,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
          //Articles
          Container(
            color: Colors.red,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
        ],
      ),
    );
  }
}
