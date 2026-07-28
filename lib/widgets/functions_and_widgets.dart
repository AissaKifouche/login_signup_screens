import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';




class FunctionsAndWidgets {

  //shows a date selector
  static Future<void> selectDate (BuildContext context, dynamic birthDateController) async {
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
      birthDateController.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
    }
  }

  //submit function
  static void submitForm({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    VoidCallback? onSuccess,
  }) {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("processing login ..."),
        ),
      );

      // Trigger custom action after validation (e.g., API call or navigation)
      if (onSuccess != null) {
        onSuccess();
      }
    }
  }

  //name input field
  static Widget nameInputFiled(TextEditingController controller) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Please enter your name";
        }
        if (value.trim().length < 2) {
          return "Name is too short";
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
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
    );
  }


  //email input field
  static Widget emailInputFiled(TextEditingController controller){
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
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
    );
  }

  //phone number
  static Widget phoneNumberInputField(TextEditingController controller,){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {

        },
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          setSelectorButtonAsPrefixIcon: true,
          leadingPadding: 12,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        initialValue: PhoneNumber(isoCode: 'GB'), // e.g. 'US', 'GB', etc.
        textFieldController: controller,
        formatInput: true,
        keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: false),
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
    );
  }


  //password input field
  static Widget passwordInputField({required TextEditingController controller, required bool isVisible, required VoidCallback onToggleVisibility}) {
    return TextFormField(
      controller: controller,
      obscureText: isVisible,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
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
            onPressed: onToggleVisibility,
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
    );
  }

  //date input field
  static Widget dateInputField({
    required BuildContext context,
    required TextEditingController controller,
}) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty){
          return "Please select a date";
        }
        return null;
      },
      readOnly: true,
      style: TextStyle(
          color: Colors.black,
          fontSize: 16
      ),
      controller: controller,
      onTap: () {
        selectDate(context, controller);
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
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
    );
  }


  //the button
  static Widget theMostUsedButton({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
    required String content
}){
    return ElevatedButton(
      onPressed: () {
        submitForm(context: context, formKey: formKey);
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
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 22
            ),
          ),
        ),
      ),
    );
  }

}