import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../model/sp_helper.dart';
import 'Intro.dart';
import 'login.dart';

class SplachScreen extends StatefulWidget {
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    NavigationFunction();
  }

  NavigationFunction() async {
    await Future.delayed(const Duration(seconds: 3));
    bool isFirstTime = SpHelper.isNewUser();
    log(isFirstTime.toString());
    if (isFirstTime) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Intro();
      }));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Intro();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        alignment: AlignmentDirectional.center,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4),
              child: SvgPicture.asset(
                'images/logo.svg',
                width: 200,
                semanticsLabel: 'SVG Image',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
