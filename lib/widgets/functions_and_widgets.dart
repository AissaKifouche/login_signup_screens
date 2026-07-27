import 'package:flutter/material.dart';




class FunctionsAndWidgets {

  //shows a date selector
  Future<void> selectDate (BuildContext context, dynamic birthDateController) async {
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
}