import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isVisible = true;
  bool isChecked = false; // for the checkbox

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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 60, bottom: 105),
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
                          children: [

                            //the login title
                            Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 34
                              ),
                            ),

                            //the row for dont have an account ..
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),
                                ),

                                TextButton(
                                  onPressed: (){

                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.blueAccent
                                    ),
                                  ),
                                )
                              ],
                            ),

                            SizedBox(height: 24,),


                            //the email input field

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
