import 'package:flutter/material.dart';

class CenterPage extends StatefulWidget {
  const CenterPage({Key? key}) : super(key: key);
  @override
  CenterPageState createState() => CenterPageState();
}

class CenterPageState extends State<CenterPage> {
  Widget _buildList(double h, double w) {
    return mainPage(h, w);
  }

  Container mainPage(double h, double w) {
    const String str = '''jdlkjaslkcjwilajlckwjalkcwjaildjalksdjaslidjaiodl''';

    return Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 29, 39, 46)),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                    width: w,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        top: 100, right: 10, left: 10, bottom: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 128, 128, 128)),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 29, 39, 46)),
                    child: const Text(str,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 205, 211, 217),
                            fontFamily: 'Courier'),
                        textAlign: TextAlign.center))),
            Expanded(
                flex: 1,
                child: Container(
                    width: w,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        top: 5, bottom: 10, right: 10, left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 128, 128, 128)),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 29, 39, 46)),
                    child: const Text('testing',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 205, 211, 217),
                            fontFamily: 'Courier'),
                        textAlign: TextAlign.center)))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Main Page',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 205, 211, 217),
                  fontFamily: 'Courier',
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: const Color.fromARGB(255, 145, 69, 190),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                  color: const Color.fromARGB(255, 205, 211, 217),
                  height: 2.0)),
        ),
        extendBodyBehindAppBar: true,
        body: _buildList(newheight, width));
  }
}
