import 'all.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  final PageController _profile = PageController(initialPage: 1);

  // example of getting user's name from database
  String _username =
      'Nave Flactem'; //This will be replaced with code from the database for username

  @override
<<<<<<< HEAD
  Widget build(BuildContext context) {//hello
=======
  Widget build(BuildContext context) {
    //hello
>>>>>>> 624ab647d9e2859594eb5e4aea65a943562d9b4c
    return Scaffold(
      body: PageView(
        controller: _profile,
        children: [
          //Settings
          const SettingsPage(),
          //Profile
          Container(
            color: const Color.fromARGB(255, 69, 69, 69),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(79.5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 172, 172, 172),
                      borderRadius: BorderRadius.circular(0.0),
                      border: Border.all(
                        color: const Color.fromARGB(255, 34, 34, 34)!,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 0.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: CircleAvatar(
                            radius: 75.0,
                            backgroundImage: const NetworkImage(
                              'https://images.unsplash.com/photo-1601887389937-0b02c26b602c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 300),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _username, // display user's name
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                'User Bio',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 450.0,
                  right: 130.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      // add code to change profile picture
                    },
                    child: const Icon(Icons.edit),
                  ),
                ),
              ],
            ),
          ),

          //History
          const HistoryPage(),
        ],
      ),
    );
  }
}
