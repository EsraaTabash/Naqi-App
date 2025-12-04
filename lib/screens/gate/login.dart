import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naqi/screens/Home/Home.dart';


class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int selectedIndex = 0;
  TextEditingController mobileNumController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isIconOnRight = false;
  String buttonText = 'AR';

  final _formKey = GlobalKey<FormState>();
  final _mobileNumFormKey = GlobalKey<FormState>();
  final _passFormKey = GlobalKey<FormState>();

  String? mobileNumError;
  String? passError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/bg.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade50.withOpacity(0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.001,
                        ),
                        child: SvgPicture.asset(
                          'images/logo.svg',
                          width: 200,
                          semanticsLabel: 'SVG Image',
                        ),
                      ),
                      SizedBox(height:20),
                      Column(
                        children: [
                          Column(
                            children: [
                              NavigationBar(
                                onIndexChanged: (index) {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Form(
                                      key: _mobileNumFormKey,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: mobileNumController,
                                        decoration: InputDecoration(
                                          isCollapsed: true,
                                          hintText: "Enter mobile number",
                                          hintStyle: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 15,
                                            color: Colors.grey,
                                          ),
                                          contentPadding: EdgeInsets.all(15),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide.none,
                                          ),
                                          errorText: mobileNumError,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter mobile number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    child: Form(
                                      key: _passFormKey,
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        obscureText: true,
                                        controller: passController,
                                        decoration: InputDecoration(
                                          isCollapsed: true,
                                          hintText: "Enter password",
                                          hintStyle: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 15,
                                            color: Colors.grey,
                                          ),
                                          contentPadding: EdgeInsets.all(15),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide.none,
                                          ),
                                          errorText: passError,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forget Password?',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationThickness: 1.0,
                                    fontFamily: "Cairo",
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
                            child: InkWell(
                              onTap: () {
                                _submitForm(selectedIndex);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.shade600,
                                      Colors.blue.shade400,
                                      Colors.blue.shade200
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontFamily: "Cairo",
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            alignment: AlignmentDirectional.center,
                            child: Column(
                              children: [
                                Text(
                                  'Or Login By',
                                  style: TextStyle(
                                    fontFamily: "Cairo",
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // Handle Google login
                                      },
                                      icon: SvgPicture.asset(
                                        'icons/google.svg',
                                        width: 45,
                                        height: 45,
                                      ),
                                    ),
                                    SizedBox(width: 7),
                                    IconButton(
                                      onPressed: () {
                                        // Handle Facebook login
                                      },
                                      icon: SvgPicture.asset(
                                        'icons/facebook.svg',
                                        width: 45,
                                        height: 45,
                                      ),
                                    ),
                                    SizedBox(width: 7),
                                    IconButton(
                                      onPressed: () {
                                        // Handle Twitter login
                                      },
                                      icon: SvgPicture.asset(
                                        'icons/twitter.svg',
                                        width: 45,
                                        height: 45,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm(int selectedIndex) {
    if (_mobileNumFormKey.currentState?.validate() == true &&
        _passFormKey.currentState?.validate() == true) {
      // Fields are not empty, process the login here
      setState(() {
        mobileNumError = null;
        passError = null;
      });

      switch (selectedIndex) {
        case 0:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(isAgent: true,)));
          break;
        case 1:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(isAgent: false,)));
          break;
        case 2:
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(isAgent: false,)));
          break;
      }
    } else {
      // Set error messages for empty fields
      setState(() {
        mobileNumError = mobileNumController.text.isEmpty ? 'Please enter mobile number' : null;
        passError = passController.text.isEmpty ? 'Please enter password' : null;
      });
    }
  }

}
class NavigationBar extends StatefulWidget {
  final ValueChanged<int> onIndexChanged;

  NavigationBar({required this.onIndexChanged});

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int selectedIndex = 0;
  double commonFontSize = 14.0; // Adjust this value as needed
  double blockHeight = 48.0; // Adjust this value as needed

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.transparent, width: 0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Use this property
          children: [
            buildFlexible('Agent', selectedIndex == 0),
            buildFlexible('Industry', selectedIndex == 1),
            buildFlexible('Delegator', selectedIndex == 2),
          ],
        ),
      ),
    );
  }

  Widget buildFlexible(String text, bool isSelected) {
    return Flexible(
      child: InkWell(
        onTap: () {
          setState(() {
            if (text == 'Agent') selectedIndex = 0;
            if (text == 'Industry') selectedIndex = 1;
            if (text == 'Delegator') selectedIndex = 2;
            widget.onIndexChanged(selectedIndex);
          });
        },
        child: SizedBox(
          height: blockHeight,
          child: buildFittedBox(text, isSelected),
        ),
      ),
    );
  }

  Widget buildFittedBox(String text, bool isSelected) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSelected
                ? [
              Colors.blue.shade600,
              Colors.blue.shade400,
              Colors.blue.shade200,
            ]
                : [Colors.white, Colors.white],
          ),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.white,
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: commonFontSize,
              fontFamily: "Cairo",
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
