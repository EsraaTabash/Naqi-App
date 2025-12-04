import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  void _launchInstagramProfile() async {
    final instagramUrl = 'https://www.instagram.com/naqiwatersa/';
    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      print('Could not launch $instagramUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.blue, // Set the desired color for the back arrow
        ),
        flexibleSpace: Container(
          color: Colors.transparent,
        ),
      ),
      body: Stack(
        children: [
          // Colorful space in the center
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade600,
                  Colors.blue.shade400,
                  Colors.blue.shade200
                ],
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                    buildCard("شارك التطبيق", context),
                    SizedBox(height: 20),
                    buildCard("الشروط و الأحكام", context),
                    SizedBox(height: 20),
                    buildCard("سياسة الاستخدام", context),
                  ],
                ),
              ),
            ),
          ),
          // White space at the top center
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 50),
              height: 150, // Adjust the height of the half-circle here
              decoration: BoxDecoration(
                color: Colors.white, // Color for the top half-circle
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                ),
              ),
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  child: SvgPicture.asset(
                    'images/logo.svg',
                    fit: BoxFit.contain,
                    // Adjust the viewBox property based on your SVG aspect ratio
                    // viewBox: 'x y width height',
                  ),
                ),
              ),
            ),
          ),
          // Social media icons at the bottom of the screen

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchInstagramProfile();
                    },
                    child: buildSocialIcon('icons/instagram.svg', 50),
                  ),
                  SizedBox(width: 20), // Add spacing between icons if needed
                  buildSocialIcon('icons/twitter.svg', 50),
                  SizedBox(width: 20), // Add spacing between icons if needed
                  buildSocialIcon('icons/sms.svg', 50),
                  SizedBox(width: 20), // Add spacing between icons if needed
                  buildSocialIcon('icons/phone.svg', 50),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget buildCard(String title, BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double cardHeight = screenHeight * 0.08; // Adjust this multiplier as needed

    return Card(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade600,
              Colors.blue.shade400,
              Colors.blue.shade200
            ],
          ),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "cairo",
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildSocialIcon(String assetPath, double iconSize) {
    return IconButton(
      icon: SvgPicture.asset(assetPath),
      iconSize: iconSize,
      onPressed: () {
        // Handle icon press
      },
    );
  }
}