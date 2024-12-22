// Method to select a date
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> selectDate(BuildContext context, TextEditingController dateController) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.blue,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(),
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null) {
    // Format the selected date and update the controller
    String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
    dateController.text = formattedDate;
  }
}