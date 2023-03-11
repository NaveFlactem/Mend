import 'all.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class DiamondContainer extends StatelessWidget {
  final double size;
  final Color color;

  const DiamondContainer({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.8),
            color.withOpacity(0.5),
            color.withOpacity(0.8),
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Transform.rotate(
          angle: pi / 4,
          child: Icon(
            Icons.star,
            size: size * 0.6,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MentalPage extends StatefulWidget {
  const MentalPage({Key? key}) : super(key: key);

  @override
  MentalPageState createState() => MentalPageState();
}

class MentalPageState extends State<MentalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 40),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text(
                'Mental',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 177, 37, 37),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text(
                  'Challenges',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 182, 30, 30),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DiamondContainer(
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  DiamondContainer(
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  DiamondContainer(
                    size: 50,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
              SizedBox(
                height: 500,
              ), // just an example of a long widget to show scrolling
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height - 75,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DiamondContainer(
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  DiamondContainer(
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  DiamondContainer(
                    size: 50,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
              SizedBox(
                height: 500,
              ), // just an example of a long widget to show scrolling
            ],
          ),
        ),
      ),
    );
  }
}
