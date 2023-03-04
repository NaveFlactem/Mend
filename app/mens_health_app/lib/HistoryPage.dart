import 'all.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          //History
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
