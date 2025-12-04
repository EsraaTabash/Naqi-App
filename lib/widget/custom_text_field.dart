<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String label;
  TextEditingController controller;
  CustomTextfield(this.label, this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
     margin:  EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          isCollapsed: true,
          hintText: label,
          hintStyle: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.grey),
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.teal), // Set the border color
          ),
        ),
      ),
    );
  }
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String label;
  TextEditingController controller;
  CustomTextfield(this.label, this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
     margin:  EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          isCollapsed: true,
          hintText: label,
          hintStyle: TextStyle(fontFamily: 'Cairo',fontSize: 15,color: Colors.grey),
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.teal), // Set the border color
          ),
        ),
      ),
    );
  }
>>>>>>> update-2025
}