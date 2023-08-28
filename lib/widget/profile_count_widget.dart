import 'package:flutter/material.dart';
class ProfileCountWidget extends StatelessWidget {
  final String title;
  final String count;

  const ProfileCountWidget(this.title, this.count);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double responsiveFontSize = screenHeight * 0.019; // Adjust this multiplier as needed

    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontFamily: "Cairo",
            fontSize: responsiveFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontFamily: "Cairo",
            fontSize: responsiveFontSize - 2,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
}
