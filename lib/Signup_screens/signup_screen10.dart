import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_signup/widgets/functions_and_widgets.dart';

class SignupScreen10 extends StatefulWidget {
  const SignupScreen10({super.key});

  @override
  State<SignupScreen10> createState() => _SignupScreen10State();
}

class _SignupScreen10State extends State<SignupScreen10> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isVisible  = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          //the background color
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFEBC894),
                      Color(0xFFB49EF4)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                )
            ),
          ),


          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //the back arrow
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.keyboard_backspace),
                        ),

                        SizedBox(height: 24,),

                        //the white box
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            //minHeight: constraints.maxHeight,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.6),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 34,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      SizedBox(height: 12,),

                                      Text(
                                        "Create an account to continue!",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),

                                      SizedBox(height: 24,),

                                      //name input field
                                      FunctionsAndWidgets.nameInputFiled(_nameController),
                                      SizedBox(height: 5,),

                                      //email input field
                                      FunctionsAndWidgets.emailInputFiled(_emailController),
                                      SizedBox(height: 5,),

                                      //birth date input field
                                      FunctionsAndWidgets.dateInputField(context: context, controller: _birthDateController),
                                      SizedBox(height: 5,),

                                      //phone number input field
                                      FunctionsAndWidgets.phoneNumberInputField(_phoneNumberController),
                                      SizedBox(height: 5,),

                                      //password input field
                                      FunctionsAndWidgets.passwordInputField(
                                        controller: _passwordController,
                                        isVisible: isVisible,
                                        onToggleVisibility: () {
                                          setState(() {
                                            isVisible = !isVisible;
                                          });
                                        }
                                      ),


                                      SizedBox(height: 24,),

                                      //the register button
                                      FunctionsAndWidgets.theMostUsedButton(formKey: _formKey, context: context, content: "Register"),

                                      SizedBox(height: 24,),
                                      //the already have an account row
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Already have an account?",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                          TextButton(
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Log in",
                                              style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
