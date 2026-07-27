import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_signup/Signup_screens/signup_screen1.dart';
import 'package:login_signup/widgets/functions_and_widgets.dart';

class SignupScreen2 extends StatefulWidget {
  const SignupScreen2({super.key});

  @override
  State<SignupScreen2> createState() => _SignupScreen2State();
}

class _SignupScreen2State extends State<SignupScreen2> {

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isVisible = true;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _birthDateController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // a container to get the gradient color
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFF2567E8),
                      Color(0xFF1CE6DA),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),

          // all the other things
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 24, ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // a row for the logo and name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shield, color: Colors.white,),
                        SizedBox(width: 5,),
                        Text(
                          "Logo",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 34,),

                    //the white container
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.keyboard_backspace_rounded),
                            ),

                            SizedBox(height: 24,),

                            //the Sign up title
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34
                              ),
                            ),

                            //the row for already have an account ..
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),
                                ),

                                TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.blueAccent
                                    ),
                                  ),
                                )
                              ],
                            ),

                            SizedBox(height: 24,),

                            //full name input field
                            Text(
                              "Full Name",
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),

                            SizedBox(height: 5,),

                            //name input field
                            FunctionsAndWidgets.nameInputFiled(_nameController),

                            SizedBox(height: 16,),


                            //the email input field
                            Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.grey,
                                ),
                              ),

                            SizedBox(height: 5,),

                            //the email input field
                            FunctionsAndWidgets.emailInputFiled(_emailController),

                            SizedBox(height: 16,),

                            //birth date input field
                            Text(
                              "Date of Birth",
                              style: TextStyle(color: Colors.grey),
                            ),

                            FunctionsAndWidgets.dateInputField(context: context, controller: _birthDateController),

                            SizedBox(height: 16,),

                            //phone number input field
                            Text(
                              "Phone Number",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 5,),
                            FunctionsAndWidgets.phoneNumberInputField(_phoneNumberController),



                            SizedBox(height: 16,),

                            //the password field
                            Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),

                            SizedBox(height: 8,),

                            //the password input field
                            FunctionsAndWidgets.passwordInputField(
                              controller: _passwordController,
                              isVisible: isVisible,
                              onToggleVisibility: (){
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              }
                            ),



                            SizedBox(height: 24,),

                            //the register button
                            FunctionsAndWidgets.theMostUsedButton(
                              formKey: _formKey,
                              content: "Register",
                              context: context,
                            ),



                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
