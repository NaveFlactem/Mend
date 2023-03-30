import 'package:flutter/material.dart';

class ChangeUserNamePage extends StatefulWidget {
  const ChangeUserNamePage({Key? key}) : super(key: key);

  @override
  _ChangeUserNamePageState createState() => _ChangeUserNamePageState();
}

class _ChangeUserNamePageState extends State<ChangeUserNamePage> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _saveUsername() {
    // TODO: save new username to database or storage
    String newUsername = _usernameController.text;
    print('New username: $newUsername');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // set background color to gray
      appBar: AppBar(
        backgroundColor: Colors.grey[800], // set app bar color to dark grey
        title: Text('Change Username'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'New Username',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveUsername,
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[800], // set button color to dark grey
              ),
            ),
          ],
        ),
      ),
    );
  }
}
