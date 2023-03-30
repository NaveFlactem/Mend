import 'package:flutter/material.dart';

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
            color: Color.fromARGB(255, 69, 69, 69),
            child: Container(
              padding: const EdgeInsets.all(0.5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 172, 172, 172),
                borderRadius: BorderRadius.circular(0.0),
                border: Border.all(
                  color: Color.fromARGB(255, 69, 69, 69),
                  width: 20.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 32.0, bottom: 8.0),
                    child: Center(
                      child: Text(
                        'History:',
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Georgia',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
