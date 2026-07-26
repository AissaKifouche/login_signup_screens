import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupScreen1 extends StatefulWidget {
  const SignupScreen1({super.key});

  @override
  State<SignupScreen1> createState() => _SignupScreen1State();
}

class _SignupScreen1State extends State<SignupScreen1> {

  bool isVisible = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

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
  void _submitForm(){
    if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Processing Login..."),
        ),
      );
    }
  }


  // a function to show the date picker
  Future<void> _selectDate (BuildContext context) async {
    final DateTime? picked = await showDatePicker(context:  context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xFF004481),
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
            ),
            child: child!,
          );
        }
    );

    if (picked != null){
      _birthDateController.text = "${picked.year} - ${picked.month.toString().padLeft(2, '0')} - ${picked.day.toString().padLeft(2, '0')}";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                //the back arrow
                IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  constraints: BoxConstraints(),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_outlined),
                ),
          
                SizedBox(height: 32,),
          
                //some text login ...
                Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
          
                SizedBox(height: 12,),
          
                Text(
                  "Create an account to continue!",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14
                  ),
                ),
          
                SizedBox(height: 32,),
          
          
                //the name input field
                Text(
                  "Full Name",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
          
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
          
                //email input field
                Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
          
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
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_month, color: Colors.grey,),
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
                ),
          
                SizedBox(height: 16,),
          
                //the phone number input field
                Text(
                  "Phone Number",
                  style: TextStyle(
                      color: Colors.grey
                  ),
                ),
          

                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {

                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    setSelectorButtonAsPrefixIcon: true,
                    leadingPadding: 12,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  initialValue: PhoneNumber(isoCode: 'GB'), // e.g. 'US', 'GB', etc.
                  textFieldController: _phoneNumberController,
                  formatInput: true,
                  keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                  inputDecoration: InputDecoration(
                    hintText: "(454) 726-0592",
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFEDF1F3), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFEDF1F3), width: 2),
                    ),
                  ),
                ),


                SizedBox(height: 16,),
          
                //passwor input field
                Text(
                  "Password",
                  style: TextStyle(color: Colors.grey),
                ),
          
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
          
                SizedBox(height: 24,),
          
                //the register button
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
          
                SizedBox(height: 36,),
          
                //the already have an account ...
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ]
                )
          
          
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
