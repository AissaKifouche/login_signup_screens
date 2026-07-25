import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen7 extends StatefulWidget {
  const LoginScreen7({super.key});

  @override
  State<LoginScreen7> createState() => _LoginScreen7State();
}

class _LoginScreen7State extends State<LoginScreen7> {

  final _formKey = GlobalKey<FormState>();
  int isSelectedIndex = 0;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isVisible = true;
  bool isChecked = false;


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  void _submitForm(){
    if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Processing Login..."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.black,
            ),


            //the fog effect in background
            Positioned(
              top: -60,
              right: -80,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                child: Container(
                  height: 280,
                  width: 280,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.white.withValues(alpha: 0.18),
                        Colors.transparent,
                      ]
                    )
                  ),
                ),
              ),
            ),

            Positioned(
              top: 20,
              right: -0,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                child: Container(
                  width: 220,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.white.withValues(alpha: 0.4),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //the everything
            Column(
              children: [
                Container(
                  //color: Colors.transparent,
                  padding: EdgeInsets.all(24),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.shield,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(width: 5,),
                            Text(
                              "Logo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            ),
                          ],
                        ),
                    
                        SizedBox(height: 32,),
                    
                        Text(
                          "Get Started now",
                          style: TextStyle(
                            color: Colors.white,
                           fontSize: 36
                          ),
                        ),
                    
                        SizedBox(height: 16,),
                    
                        Text(
                          "Create an account or log in to explore about our app",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )
                    ),
                    child: SingleChildScrollView(
                      child: Column(

                        children: [

                          //the login and signup row
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(2),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelectedIndex = 0;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      decoration: BoxDecoration(
                                        color: (isSelectedIndex == 0) ? Colors.white : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Log in",
                                        style: TextStyle(
                                          color: (isSelectedIndex == 0) ? Colors.black : Colors.grey[800],
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),


                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelectedIndex = 1;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      decoration: BoxDecoration(
                                        color: (isSelectedIndex == 1) ? Colors.white : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                            color: (isSelectedIndex == 1) ? Colors.black : Colors.grey[800],
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(height: 24,),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          SizedBox(height: 8,),

                          //the email input field
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "doivnv@gmail.com",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xFFEDF1F3),
                                      width: 2,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Color(0xFFEDF1F3),
                                        width: 2
                                    )
                                )
                            ),
                            validator: (value) {
                              if(value == null || value.trim().isEmpty) {
                                return "Please Enter Your Email";
                              }
                              if( !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(value)) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 16,),

                          //the password field
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          SizedBox(height: 8,),

                          //the password input field
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            controller: _passwordController,
                            obscureText: isVisible,
                            decoration: InputDecoration(
                                hintText: "****",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xFFEDF1F3),
                                      width: 2,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(0xFFEDF1F3),
                                      width: 2
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: isVisible? Icon(Icons.visibility_off): Icon(Icons.visibility),
                                  color: Colors.grey,
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                )
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 16,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.compact,
                                      value: isChecked,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          isChecked = newValue ?? false;
                                        });
                                      },
                                      activeColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(3)
                                      )
                                  ),

                                  Text(
                                    "Remember me",
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),
                                  )
                                ],
                              ),

                              TextButton(
                                onPressed: () {

                                },
                                child: Text(
                                  "Forgot Password ?",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ),

                            ],
                          ),


                          SizedBox(height: 24,),

                          ElevatedButton(
                            onPressed: () {
                              _submitForm();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                elevation: 4
                            ),
                            child: Center(
                              child: Text(
                                "Log in",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 24,),

                          // the or divider
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Color(0xFFEDF1F3),
                                  thickness: 2,
                                ),
                              ),

                              SizedBox(width: 8,),

                              Text(
                                "Or",
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),

                              SizedBox(width: 8,),

                              Expanded(
                                child: Divider(
                                  color: Color(0xFFEDF1F3),
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 18,),

                          //the google method button
                          ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: Color(0xFFEDF1F3),
                                  ),
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/images/google.svg"),
                                  SizedBox(width: 10,),
                                  Text(
                                    "Continue with Google",
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 10,),

                          // the facebook method
                          ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: Color(0xFFEDF1F3),
                                  ),
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/images/2021_Facebook_icon 1.svg"),
                                  SizedBox(width: 10,),
                                  Text(
                                    "Continue with Facebook",
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
