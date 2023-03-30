import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:avatar_glow/avatar_glow.dart';

class PhysicalPage extends StatefulWidget {
  const PhysicalPage({Key? key}) : super(key: key);
  @override
  PhysicalPageState createState() => PhysicalPageState();
}

class PhysicalPageState extends State<PhysicalPage> {
  Widget _buildList(double h, double w) {
    return PageView(
        scrollDirection: Axis.vertical,
        children: [pageOne(h, w), pageTwo(h, w), pageThree(h, w)]);
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
    String title = 'Sore But Sturdy';
    String instruction =
        '''Instructions:\nGet down on all fours, placing your hands slightly wider than your shoulders. Straighten your arms and legs. Lower your body until your chest nearly touches the floor. Pause, then push yourself back up. Repeat.''';

    return Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 29, 39, 46)),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 100, right: 15, left: 15, bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: borderedBody(),
                    child: Column(
                      children: [
                        Expanded(flex: 1, child: myTitle(title)),
                        Expanded(flex: 10, child: pageOneBody(instruction))
                      ],
                    ))),
            Expanded(
                flex: 2,
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 10, right: 15, left: 15, bottom: 15),
                    decoration: borderedBody(),
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: progress(h, w)),
                        Expanded(flex: 1, child: myButtons(h, w))
                      ],
                    )))
          ],
        ));
  }

  Container myTitle(String title) //page one title
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

  Container pageOneBody(String instruction) //page one text body
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

  Container progress(double h, double w) //filled percentage summary
  {
    return Container(
        height: h,
        width: w,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
        child: LiquidCircularProgressIndicator(
            value: 0.50,
            valueColor:
                const AlwaysStoppedAnimation(Color.fromARGB(255, 145, 69, 190)),
            backgroundColor: Colors.black,
            borderColor: Colors.white,
            borderWidth: 1.5,
            direction: Axis.vertical,
            center: const Text("50%", style: TextStyle(color: Colors.white))));
  }

  Container myButtons(double h, double w) //buttons
  {
    return Container(
        width: w,
        height: h,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
        child: const MyWidget());
  }

//--------------------------------------------------------------------------------------------------------------------------------------------//
//================================================================= PAGE TWO =================================================================//
//--------------------------------------------------------------------------------------------------------------------------------------------//

  Container pageTwo(double h, double w) {
    const String str = '''jdlkjaslkcjwilajlckwjalkcwjaildjalksdjaslidjaiodl''';

    return Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 29, 39, 46)),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                    width: w,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        top: 100, right: 10, left: 10, bottom: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 128, 128, 128)),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 29, 39, 46)),
                    child: const Text(str,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 205, 211, 217),
                            fontFamily: 'Courier'),
                        textAlign: TextAlign.center))),
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
                    child: const Text('testing',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 205, 211, 217),
                            fontFamily: 'Courier'),
                        textAlign: TextAlign.center)))
          ],
        ));
  }

//--------------------------------------------------------------------------------------------------------------------------------------------//
//================================================================= PAGE THREE ===============================================================//
//--------------------------------------------------------------------------------------------------------------------------------------------//

  Container pageThree(double h, double w) {
    const String str = '''jdlkjaslkcjwilajlckwjalkcwjaildjalksdjaslidjaiodl''';

    return Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 29, 39, 46)),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                    width: w,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        top: 100, right: 10, left: 10, bottom: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 128, 128, 128)),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 29, 39, 46)),
                    child: const Text(str,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 205, 211, 217),
                            fontFamily: 'Courier'),
                        textAlign: TextAlign.center))),
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
                    child: const Text('testing',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 205, 211, 217),
                            fontFamily: 'Courier'),
                        textAlign: TextAlign.center)))
          ],
        ));
  }

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
        body: _buildList(newheight, width));
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



  // AvatarGlow test_func()
  // {
  //   return AvatarGlow(
  //     endRadius: 60.0,
  //     child: Material(     // Replace this child with your own
  //       elevation: 8.0,
  //       shape: const CircleBorder(),
  //       child: CircleAvatar(
  //         backgroundColor: Colors.grey[100],
  //         radius: 30.0,
  //         child: Image.asset(
  //           'asset/images/IMG_5051.jpg',
  //           height: 50,
  //         ),
  //       ),
  //     ),
  //     );
  // }