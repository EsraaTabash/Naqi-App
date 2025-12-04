import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_svg/svg.dart';
import '../../widget/profile_count_widget.dart';
import '../gate/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEditing = false;
  TextEditingController nameController = TextEditingController(
    text: 'Esraa Mazen Tabash',
  );
  TextEditingController phoneNumberController = TextEditingController(
    text: '+970 592341806',
  );

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _showConfirmationDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      showCloseIcon: true,
      title: "Update Profile",
      btnCancelColor: Colors.red.shade600,
      desc: "Are you sure you want to update your profile?",
      btnOkOnPress: () {
        _toggleEditing();
      },
      btnCancelOnPress: () {
        nameController.text = 'Esraa Mazen Tabash';
        phoneNumberController.text = '+970 592341806';
        _toggleEditing();
      },
    ).show();
  }

  void _showLogoutDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      showCloseIcon: true,
      title: "Logout",
      btnCancelColor: Colors.red.shade600,
      desc: "Are you sure you want to logout?",
      btnOkOnPress: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return Login();
            },
          ),
        );
      },
      btnCancelOnPress: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade600,
                Colors.blue.shade400,
                Colors.blue.shade200,
              ],
            ),
          ),
        ),
        title: Text("Profile", style: TextStyle(fontFamily: "Cairo")),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showLogoutDialog(); // Call your logout function here
            },
            icon: Icon(Icons.logout), // Add the logout icon
          ),
        ],
      ),

      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.blue.shade50,
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [
            //       Colors.blue.shade600,
            //       Colors.blue.shade400,
            //       Colors.blue.shade200
            //     ],
            //   ),
            // ),
          ),
          Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SvgPicture.asset(
                      'images/profile.svg',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileCountWidget("Assigned", "0"),
                        ProfileCountWidget("Completed", "100k"),
                        ProfileCountWidget("Orders", "200"),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: nameController,
                      enabled: isEditing,
                      style: TextStyle(fontSize: 15.0, fontFamily: "Cairo"),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue.shade700),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 14.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: phoneNumberController,
                      enabled: isEditing,
                      style: TextStyle(fontSize: 15.0, fontFamily: "Cairo"),
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue.shade700),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 14.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _toggleEditing,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.blue.shade300,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        isEditing ? "Cancel" : "Edit Profile",
                        style: TextStyle(fontFamily: "Cairo", fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (isEditing) ...[
                      ElevatedButton(
                        onPressed: _showConfirmationDialog,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.blue.shade700,
                          foregroundColor: Colors.white,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'Save Changes',
                              style: TextStyle(
                                fontFamily: "Cairo",
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                    // GestureDetector(
                    //   onTap: _showLogoutDialog,
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(vertical: 12),
                    //     decoration: BoxDecoration(
                    //         color: Colors.red.shade500,
                    //         borderRadius: BorderRadius.circular(30)),
                    //     child: Center(
                    //       child: Text(
                    //         'Logout',
                    //         style: TextStyle(
                    //           fontFamily: "Cairo",
                    //           fontSize: 18,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
