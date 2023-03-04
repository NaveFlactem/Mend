import 'all.dart';

class PhysicalPage extends StatefulWidget {
  const PhysicalPage({Key? key}) : super(key: key);

  @override
  PhysicalPageState createState() => PhysicalPageState();
}

class PhysicalPageState extends State<PhysicalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          //Physical
          Container(
            color: Colors.green,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
        ],
      ),
    );
  }
}
