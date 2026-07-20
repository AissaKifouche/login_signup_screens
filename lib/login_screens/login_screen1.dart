import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  bool isVisible = true;//to show or hide the password
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 34, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          
              children: [
                Row(
                  children: [
                    //just a random icon to use it as a logo
                    Icon(Icons.seventeen_mp_outlined, size: 40,),
                    Text(
                      "Logo",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black
                      ),
                    ),
                  ],
                ),
          
                SizedBox(height: 34,),
          
                Text(
                  "Sign in to your Account",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
          
                SizedBox(height: 12,),
          
                Text(
                  "Enter your email and password to log in ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          
                SizedBox(height: 32,),
          
                Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
          
                SizedBox(height: 8,),
          
                //the email input field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
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
                TextField(
                  controller: _passwordController,
                  obscureText: isVisible,
                  decoration: InputDecoration(
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
                ),
          
          
                SizedBox(height: 16,),
          
                //the forgot password text in right side
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {  },
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
          
                SizedBox(height: 24,),
          
                //the login button
                ElevatedButton(
                  onPressed: () {
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
                      "OR",
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

                SizedBox(height: 32,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(width: 6,),

                    TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blueAccent
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
