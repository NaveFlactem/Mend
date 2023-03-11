import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseReference _promptRef;
  late String _prompt;

  @override
  void initState() {
    super.initState();

    // Initialize the Firebase database reference and fetch the prompt
    _promptRef = FirebaseDatabase.instance.reference().child('prompts');
    _promptRef.once().then((DataSnapshot snapshot) {
      setState(() {
        _prompt = snapshot.value['prompt'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal Prompt'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Journal Prompt:',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              Text(
                _prompt ?? 'Loading prompt...',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: Text('Start Journaling'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
