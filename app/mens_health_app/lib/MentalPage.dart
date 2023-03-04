import 'all.dart';

class MentalPage extends StatefulWidget {
  const MentalPage({Key? key}) : super(key: key);

  @override
  MentalPageState createState() => MentalPageState();
}

class MentalPageState extends State<MentalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          //Mental
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
