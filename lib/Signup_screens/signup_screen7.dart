import 'dart:ui';
import 'package:login_signup/widgets/functions_and_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class SignupScreen7 extends StatefulWidget {
  const SignupScreen7({super.key});

  @override
  State<SignupScreen7> createState() => _SignupScreen7State();
}

class _SignupScreen7State extends State<SignupScreen7> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isVisible = true;
  bool isChecked = false;


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();


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
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Log in",
                                        style: TextStyle(
                                            color: Colors.grey[800],
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

                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      decoration: BoxDecoration(
                                          color: Colors.white ,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                            color: Colors.black,
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
                              "Full Name",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),

                          SizedBox(height: 8,),
                          FunctionsAndWidgets.nameInputFiled(_nameController),


                          SizedBox(height: 16,),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),

                          SizedBox(height: 8,),

                          //the email input field
                          FunctionsAndWidgets.emailInputFiled(_emailController),

                          SizedBox(height: 16,),

                          //the birth date field
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Birth Date",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),

                          SizedBox(height: 8,),
                          FunctionsAndWidgets.dateInputField(context: context, controller: _birthDateController),


                          SizedBox(height: 16,),

                          //phone number input field
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),

                          SizedBox(height: 8,),
                          FunctionsAndWidgets.phoneNumberInputField(_phoneNumberController),


                          SizedBox(height: 16,),

                          //the password field
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.grey,
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



                          SizedBox(height: 24,),

                          //register button
                          FunctionsAndWidgets.theMostUsedButton(
                            formKey: _formKey,
                            context: context,
                            content: "Register"
                          ),

                          SizedBox(height: 24,),


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
