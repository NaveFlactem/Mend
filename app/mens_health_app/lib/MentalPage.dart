import 'all.dart';

class MentalPage extends StatefulWidget {
  const MentalPage({Key? key}) : super(key: key);
  @override
  PhysicalPageState createState() => PhysicalPageState();
}

class MentalPageState extends State<MentalPage> {
  Widget _buildList(double h, double w) {
    return PageView(
        scrollDirection: Axis.vertical,
        children: [pageOne(h, w), pageTwo(h, w), pageThree(h, w)]);
  }

  Container pageOne(double h, double w) {
    const String challengeOne = '''
A random paragraph can also be an excellent way for a writer to tackle writers block. Writing block can often happen due to being stuck with a current project that the writer is trying to complete. By inserting a completely random
''';

    return Container(
        color: const Color.fromARGB(255, 30, 41, 82),
        child: Center(
            child: Container(
                color: const Color.fromARGB(255, 20, 31, 72),
                height: h,
                width: w,
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 95, right: 10, left: 10, bottom: 10),
                    child: const Text(challengeOne,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 237, 171, 26),
                          fontFamily: 'Times New Roman',
                        ))))));
  }

  Container pageTwo(double h, double w) {
    return Container(
        color: const Color.fromARGB(255, 30, 41, 82),
        child: Center(
            child: Container(
                color: const Color.fromARGB(255, 20, 31, 72),
                height: h,
                width: w,
                margin: const EdgeInsets.only(
                    top: 0, right: 10, left: 10, bottom: 10),
                child: const Text('jdkalsdjsak'))));
  }

  Container pageThree(double h, double w) {
    return Container(
        color: const Color.fromARGB(255, 30, 41, 82),
        child: Center(
            child: Container(
                color: const Color.fromARGB(255, 20, 31, 72),
                height: h + 30,
                width: w - 30.0,
                margin: const EdgeInsets.only(
                    top: 110, right: 10, left: 10, bottom: 10),
                child: const Text(''))));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 41, 82),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
            Expanded(child: Icon(Icons.star_border)),
            SizedBox(width: 10),
            Expanded(child: Icon(Icons.star_border)),
            SizedBox(width: 10),
            Expanded(child: Icon(Icons.star_border)),
            SizedBox(width: 10),
            Flexible(
              flex: 10,
              child: Text(
                'Mental Health',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 237, 171, 26),
                  fontFamily: 'Courier',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(color: Colors.orange, height: 2.0),
        ),
        toolbarHeight: 70,
        centerTitle: false,
      ),
      extendBodyBehindAppBar: true,
      body: _buildList(newheight, width),
    );
  }
}
