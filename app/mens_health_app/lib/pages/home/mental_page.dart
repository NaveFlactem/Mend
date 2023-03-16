import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class MentalPage extends StatefulWidget {
  const MentalPage({Key? key}) : super(key: key);
  @override
  MentalPageState createState() => MentalPageState();
}

class MentalPageState extends State<MentalPage> {
  final ConfettiController _confettiController = ConfettiController();
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  bool ponder = false;
  bool think = false;
  bool read = false;

  Widget _buildList(double h, double w) {
    List<Widget> pages = List.generate(
      ponder
          ? (think ? (read ? 3 : 2) : 2)
          : 1, // Check read before showing pageThree
      (index) {
        if (index == 0) {
          return pageOne(h, w);
        } else if (index == 1) {
          return ponder
              ? pageTwo(h, w)
              : Container(); // Check ponder before showing pageTwo
        } else {
          return think
              ? pageThree(h, w)
              : Container(); // Check think before showing pageThree
        }
      },
    );

    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      physics:
          (ponder && think && read) // Check if all challenges are completed
              ? const AlwaysScrollableScrollPhysics() // Allow scrolling
              : const NeverScrollableScrollPhysics(),
      children: [pageOne(h, w), pageTwo(h, w), pageThree(h, w)],
      // Prevent scrolling      controller: // Add the _pageController // Disables manual scrolling
    );
  }

//--------------------------------------------------------------------------------------------------------------------------------------------//
//================================================================= PAGE FUNCTIONS ===========================================================//
//--------------------------------------------------------------------------------------------------------------------------------------------//

//--------------------------------------------------------------------------------------------------------------------------------------------//
//================================================================= PAGE ONE =================================================================//
//--------------------------------------------------------------------------------------------------------------------------------------------//

  Container pageOne(double h, double w) {
    const String challengeone = '''
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
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 100, right: 10, left: 10, bottom: 10),
                  child: const Text(
                    'Challenge 1 of 3 \n         Ponder',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 237, 171, 26),
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 12,
                child: Container(
                    width: w,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 128, 128, 128)),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 40, 51, 92)),
                    child: const Text(challengeone,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Courier'),
                        textAlign: TextAlign.center)),
                //MAKE PROMPT BOX HERE!! (MAKE IT A CONTAINER)
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 128, 128, 128)),
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 40, 51, 92)),
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your text here',
                      border: OutlineInputBorder(),
                      //MAKE PROMPT BOX HERE!! (MAKE IT A CONTAINER)
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: 400,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ponder = true;
                      });
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.ease);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
                      backgroundColor: ponder ? Colors.green : Colors.blue,
                    ),
                    child: Text(
                      ponder ? 'Move to challenge 2' : 'Ponder compeleted',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//--------------------------------------------------------------------------------------------------------------------------------------------//
//================================================================= PAGE TWO =================================================================//
//--------------------------------------------------------------------------------------------------------------------------------------------//

  Container pageTwo(double h, double w) {
    const String challengethree = '''
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
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 100, right: 10, left: 10, bottom: 10),
                  child: const Text(
                    'Challenge 2 of 3 \n         Think',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 237, 171, 26),
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 0, right: 10, left: 10, bottom: 10),
                  child: const Text(
                    challengethree,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 237, 171, 26),
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: 400,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        think = true;
                      });
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.ease);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
                      backgroundColor: think ? Colors.green : Colors.blue,
                    ),
                    child: Text(
                      think ? 'Move to challenge 3' : 'Think compeleted',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//--------------------------------------------------------------------------------------------------------------------------------------------//
//================================================================= PAGE THREE ===============================================================//
//--------------------------------------------------------------------------------------------------------------------------------------------//

  Container pageThree(double h, double w) {
    const String challengethree = '''
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
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 100, right: 10, left: 10, bottom: 10),
                  child: const Text(
                    'Challenge 3 of 3 \n         Read',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 237, 171, 26),
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 0, right: 10, left: 10, bottom: 10),
                  child: const Text(
                    challengethree,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 237, 171, 26),
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: 400,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        read = true;
                      });
                      if (ponder && think && read) {
                        _confettiController.play();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
                      backgroundColor: read ? Colors.green : Colors.blue,
                    ),
                    child: Text(
                      read ? 'YAY!' : 'Read compeleted',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//--------------------------------------------------------------------------------------------------------------------------------------------//
//================================================================= APPBAR ===============================================================//
//--------------------------------------------------------------------------------------------------------------------------------------------//

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
            children: [
              const Flexible(
                flex: 4,
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
              const SizedBox(width: 10),
              Expanded(
                child: Icon(ponder ? Icons.star : Icons.star_border,
                    color: ponder ? Colors.yellow : null),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Icon(think ? Icons.star : Icons.star_border,
                    color: think ? Colors.yellow : null),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Icon(read ? Icons.star : Icons.star_border,
                    color: read ? Colors.yellow : null),
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
        body: Stack(
          children: [
            _buildList(newheight, width),
            Positioned(
              top: 0,
              child: Container(
                width: width,
                height: height,
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  numberOfParticles: 100,
                  shouldLoop: false,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: FutureBuilder(
                  future: Future.delayed(const Duration(seconds: 2)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      _confettiController.stop();
                      return const SizedBox.shrink();
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
          ],
        ));
  }
} //end of class
