import 'package:flutter/material.dart';




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

  //password input field
  Widget passwordInputField({required TextEditingController controller, required bool isVisible, required VoidCallback onToggleVisibility}) {
    return TextFormField(
      controller: controller,
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
}