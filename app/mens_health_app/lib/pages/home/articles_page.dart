import 'package:flutter/material.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          //Articles
          Container(
            color: Color.fromARGB(255, 29, 39, 46),
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
        ],
      ),
    );
  }
}
