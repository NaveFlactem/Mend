import 'all.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _savePassword() {
    // TODO: save new username to database or storage
    String newPassword = _passwordController.text;
    print('New password: $newPassword');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // set background color to gray
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: Colors.grey[800], // set app bar color to dark grey
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle: TextStyle(color: Colors.grey[800]), // set label color to dark grey
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _savePassword,
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