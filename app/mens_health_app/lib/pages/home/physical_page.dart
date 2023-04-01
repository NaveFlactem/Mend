import 'package:flutter/material.dart';
import 'package:async_button_builder/async_button_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PhysicalPage extends StatefulWidget {
  const PhysicalPage({Key? key}) : super(key: key);
  @override
  PhysicalPageState createState() => PhysicalPageState();
}

Future<List<String>> getData(
    String collec, String doc, String field, int index) async {
  final docRef =
      await FirebaseFirestore.instance.collection(collec).doc(doc).get();
  final data = docRef.data() as Map<String, dynamic>;
  return List<String>.from(data[field]);
}

class PhysicalPageState extends State<PhysicalPage> {
  List<String> instructionsPhysicalData = [];
  List<String> promptPhysicalData = [];
  List<String> articlePhysicalData = [];
  @override
  void initState() {
    super.initState();
    getData('data', 'instructions', 'physical', 1).then((data) {
      setState(() {
        instructionsPhysicalData = data;
      });
    });
    getData('data', 'prompt', 'physical', 1).then((data) {
      setState(() {
        promptPhysicalData = data;
      });
    });
    getData('data', 'articles', 'physical', 1).then((data) {
      setState(() {
        articlePhysicalData = data;
      });
    });
  }

  Widget _buildPageView(double h, double w) {
    return FutureBuilder<List<String>>(
      future: getData('data', 'articles', 'physical', 1),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error loading data.'),
          );
        }

        return PageView(
          scrollDirection: Axis.vertical,
          children: [
            pageOne(h, w),
            pageTwo(h, w),
            pageThree(h, w),
          ],
        );
      },
    );
  }

//--------------------------------------------------------------------------------------------------------------------------------------------//
//================================================================= PAGE FUNCTIONS ===========================================================//
//--------------------------------------------------------------------------------------------------------------------------------------------//

  Decoration borderedTitle() //boxdecoration for rounded bordered title
  {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 144, 106, 191),
        border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)));
  }

  Decoration borderedBody() {
    return BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 128, 128, 128)),
      borderRadius: BorderRadius.circular(20),
      color: const Color.fromARGB(255, 29, 39, 46),
    );
  }

//--------------------------------------------------------------------------------------------------------------------------------------------//
//================================================================= PAGE ONE =================================================================//
//--------------------------------------------------------------------------------------------------------------------------------------------//

  Container pageOne(double h, double w) {
    getData('data', 'instructions', 'physical', 1);
    String title = 'Daily Exercise';
    var instruction = '';
    instruction = instructionsPhysicalData[1]
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '');

    return Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 29, 39, 46)),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                    width: w,
                    margin: const EdgeInsets.only(
                        top: 100, right: 15, left: 15, bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: borderedBody(),
                    child: Column(
                      children: [
                        Expanded(flex: 1, child: firstTitle(title)),
                        Expanded(flex: 10, child: firstBody(instruction))
                      ],
                    ))),
            Expanded(
                flex: 1,
                child: Container(
                    width: w,
                    margin: const EdgeInsets.only(
                        top: 5, right: 15, left: 15, bottom: 15),
                    decoration: borderedBody(),
                    child: AsyncButtonBuilder(
                      child: Text('Complete',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      onPressed: () async {
                        await Future.delayed(Duration(seconds: 1));
                      },
                      builder: (context, child, callback, _) {
                        return TextButton(
                          child: child,
                          onPressed: callback,
                        );
                      },
                    )))
          ],
        ));
  }

  Container firstTitle(String title) //page one title
  {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.only(right: 10, left: 10),
        decoration: borderedTitle(),
        child: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: 'Courier'),
            textAlign: TextAlign.center));
  }

  Container firstBody(String instruction) //page one text body
  {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Text(instruction,
            style: const TextStyle(
                height: 1.2,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 205, 211, 217),
                fontFamily: 'Courier'),
            textAlign: TextAlign.center));
  }

//--------------------------------------------------------------------------------------------------------------------------------------------//
//================================================================= PAGE TWO =================================================================//
//--------------------------------------------------------------------------------------------------------------------------------------------//

  Container pageTwo(double h, double w) {
    getData('data', 'prompt', 'physical', 1);
    String title = 'Daily Ponder';
    String str = '';
    str = promptPhysicalData[1]
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '');

    return Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 29, 39, 46)),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    width: w,
                    margin: const EdgeInsets.only(
                        top: 100, right: 15, left: 15, bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: borderedBody(),
                    child: Column(
                      children: [
                        Expanded(flex: 2, child: firstTitle(title)),
                        Expanded(flex: 10, child: firstBody(str))
                      ],
                    ))),
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
                    child: TextField(
                        controller:
                            TextEditingController(text: 'Insert Text Here'),
                        maxLines: 20,
                        minLines: 20,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 205, 211, 217),
                            fontFamily: 'Courier'),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                        ))))
          ],
        ));
  }

  Container secondTitle(String title) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.only(right: 10, left: 10),
        decoration: borderedTitle(),
        child: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: 'Courier'),
            textAlign: TextAlign.center));
  }

  Container secondBody(String body) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Text(body,
            style: const TextStyle(
                height: 1.2,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromARGB(255, 205, 211, 217),
                fontFamily: 'Courier'),
            textAlign: TextAlign.center));
  }

//--------------------------------------------------------------------------------------------------------------------------------------------//
//================================================================= PAGE THREE ===============================================================//
//--------------------------------------------------------------------------------------------------------------------------------------------//

  Container pageThree(double h, double w) {
    getData('data', 'articles', 'physical', 1);
    String title = 'Daily Dose of Readings';
    String str = '';
    str = articlePhysicalData[1]
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '');

    return Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 29, 39, 46)),
        child: Container(
            width: w,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(
                top: 100, right: 10, left: 10, bottom: 10),
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 128, 128, 128)),
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 29, 39, 46)),
            child: Column(
              children: [
                Expanded(flex: 1, child: thirdTitle(title)),
                Expanded(flex: 15, child: thirdBody(str))
              ],
            )));
  }

  Container thirdTitle(String title) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.only(right: 10, left: 10),
        decoration: borderedTitle(),
        child: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: 'Courier'),
            textAlign: TextAlign.center));
  }

  Container thirdBody(String body) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Text(body,
            style: const TextStyle(
                height: 1.2,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromARGB(255, 205, 211, 217),
                fontFamily: 'Courier'),
            textAlign: TextAlign.center));
  }

  //--------------------------------------------------------------------------------------------------------------------------------------------//
//================================================================= BUILD WIDGET ===============================================================//
//--------------------------------------------------------------------------------------------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Physical Health',
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
        body: _buildPageView(newheight, width));
  }
}

//        TESTING AREA        //
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const RippleEffect();
  }
}

class RippleEffect extends StatefulWidget {
  const RippleEffect({Key? key}) : super(key: key);
  @override
  _RippleEffectState createState() => _RippleEffectState();
}

class _RippleEffectState extends State<RippleEffect> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
          width: 120,
          height: 120,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutQuart,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purple,
            boxShadow: [
              if (show)
                for (var i = 0; i < 4; i += 1)
                  BoxShadow(
                      spreadRadius: i * 15.0,
                      color: const Color.fromARGB(255, 48, 187, 64)
                          .withAlpha((255 ~/ (i + 1))))
            ],
          ),
          child: GestureDetector(onTapDown: _onTapDown, onTapUp: _onTapUp)),
    );
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      show = !show;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      show = !show;
    });
  }
}
