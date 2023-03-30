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
            color: Colors.purple,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
        ],
      ),
    );
  }
}
