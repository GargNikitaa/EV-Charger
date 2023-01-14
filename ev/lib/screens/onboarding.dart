import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'content_model.dart';
import 'login_screen.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return SlidingSheet(
                    //backdropColor: contents[i].bg,
                    elevation: 8,
                    color: Colors.white,
                    cornerRadius: 50,
                    snapSpec: const SnapSpec(
                      // Enable snapping. This is true by default.
                      snap: true,
                      // Set custom snapping points.
                      snappings: [0.45, 0.7, 1.0],
                      // Define to what the snappings relate to. In this case,
                      // the total available space that the sheet can expand to.
                      positioning: SnapPositioning.relativeToAvailableSpace,
                    ),
                    // The body widget will be displayed under the SlidingSheet
                    // and a parallax effect can be applied to it.
                    body: Container(
                      color: contents[i].bg,
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                              contents[i].image,
                              height: 400,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    builder: (context, state) {
                      // This is the content of the sheet that will get
                      // scrolled, if the content is bigger than the available
                      // height of the sheet.
                      return Container(
                        height: 350,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Text(
                              contents[i].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              contents[i].description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                contents.length,
                                    (index) => buildDot(index, context),
                              ),
                            ),
                            Container(
                              height: 40,
                              margin: const EdgeInsets.all(40),
                              width: double.infinity,
                              color: Colors.green[900],
                              child: TextButton(
                                onPressed: () {
                                  if (currentIndex == contents.length - 1) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>  loginscreen(),
                                      ),
                                    );
                                  }
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.bounceIn,
                                  );
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                child: Text(currentIndex == contents.length - 1
                                    ? "Continue"
                                    : "Next"),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green[900],
      ),
    );
  }
}
