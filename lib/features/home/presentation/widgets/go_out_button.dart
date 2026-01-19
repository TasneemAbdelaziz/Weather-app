import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoOutButton extends StatelessWidget {
  VoidCallback onPressed;
   GoOutButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // يمكنك تعديل الرقم لزيادة أو تقليل الاستدارة
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // تحكم في حجم الزر
        ),
        onPressed: onPressed, child: Text("Want to Go out Today?",style: TextStyle(fontSize: 20,color: Colors.white),));
  }
}
