import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:naqi/screens/gate/introPage1.dart';
import 'package:naqi/screens/gate/introPage2.dart';
import 'package:naqi/screens/gate/introPage3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  PageController pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Set the border radius
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Set the border radius
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemCount: 3,
                onPageChanged: (val) {
                  setState(() {
                    isLastPage = (val == 2);
                  });
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return IntroPage1();
                  } else if (index == 1) {
                    return IntroPage2();
                  } else if (index == 2) {
                    return IntroPage3();
                  }
                  return Container();
                },
              ),
            ),
          ),Container(
            alignment: Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  onTap: () {
                    pageController.jumpToPage(2);
                  },
                ),
                SmoothPageIndicator(
                  count: 3,
                  controller: pageController,
                  effect: JumpingDotEffect(
                      dotColor: Colors.blueAccent.shade100,
                      activeDotColor: Colors.black54,
                      dotHeight: 25,
                      dotWidth: 25,
                      strokeWidth: 3,
                      spacing: 30,
                      jumpScale: 3
                  ),
                ),
                isLastPage
                    ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      return Login();
                    }));
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                )
                    : InkWell(
                  onTap: () {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}