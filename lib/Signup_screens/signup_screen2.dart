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
              padding: EdgeInsets.only(top: 60, ),
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

                            TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: _nameController,
                              decoration: InputDecoration(
                                  hintText: "John Doe",
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
                            ),

                            SizedBox(height: 16,),


                            //the email input field
                            Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                 fontSize: 18,
                                ),
                              ),

                            SizedBox(height: 5,),

                            //the email input field
                            TextFormField(
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

                            //birth date input field
                            Text(
                              "Date of Birth",
                              style: TextStyle(color: Colors.grey),
                            ),

                            TextField(
                              readOnly: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16
                              ),
                              controller: _birthDateController,
                              onTap: () {
                                FunctionsAndWidgets().selectDate(context, _birthDateController);
                              },
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.calendar_month, color: Colors.grey,),
                                  hintText: "DD/MM/YYYY",
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
                            ),

                            //the password field
                            Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),

                            SizedBox(height: 8,),

                            //the password input field
                            TextFormField(
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
                              child: SizedBox(
                                height: 60,
                                child: Center(
                                  child: Text(
                                    "Register",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 24,),

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
