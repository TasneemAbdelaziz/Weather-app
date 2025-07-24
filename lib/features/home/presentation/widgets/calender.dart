import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_pallet.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF17203A), // Rounded container color
        borderRadius: BorderRadius.circular(30),
      ),
      child:  DatePicker(
        DateTime.now().subtract(const Duration(days: 3)),
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.white,
        selectedTextColor:AppPallet.buttonColor,
        dateTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        dayTextStyle: const TextStyle(
          color: Colors.white54,
          fontSize: 12,
        ),
        monthTextStyle: const TextStyle(
          color: Colors.white54,
          fontSize: 12,
        ),
        height: 90,
        width: 60,
        onDateChange: (date) {
          print("Selected: $date");
        },
      ),
    );
  }
}
