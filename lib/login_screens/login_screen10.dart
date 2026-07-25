import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen10 extends StatefulWidget {
  const LoginScreen10({super.key});

  @override
  State<LoginScreen10> createState() => _LoginScreen10State();
}

class _LoginScreen10State extends State<LoginScreen10> {

  final _formKey = GlobalKey<FormState>();
  bool isChecked  = false;
  bool isVisible = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, ),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.shield,
                                color: Colors.blueAccent,
                                size: 45,
                              ),

                              SizedBox(height: 24,),

                              Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 12,),

                              Text(
                                "Enter your email and password to log in ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal
                                ),
                              ),

                              SizedBox(height: 24,),

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

                              //the remember me box and forgot password
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

                              //the login button
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
                                      "Log in",
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

                              //the or ....
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
                                    "Or login with",
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

                              SizedBox(height: 24,),

                              //the other methods row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  //the google one
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
                                    child: SvgPicture.asset("assets/images/google.svg"),
                                  ),

                                  SizedBox(width: 15,),

                                  //the facebook one
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
                                    child: SvgPicture.asset("assets/images/2021_Facebook_icon 1.svg"),
                                  ),

                                  SizedBox(width: 15,),

                                  //the apple account one
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
                                    child: Icon(Icons.apple_outlined, color: Colors.black,),
                                  ),

                                  SizedBox(width: 15,),

                                  //the last way
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
                                    child: Icon(Icons.smartphone, color: Colors.black,),
                                  ),
                                ],
                              ),

                              SizedBox(height: 24,),

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

                            ]
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
