import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_pallet.dart';

class AuthButton extends StatelessWidget{
  String buttomText;
  final VoidCallback onPressed;
   AuthButton({super.key,required this.buttomText,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppPallet.buttonColor,
          fixedSize: Size(395, 55)
        ),
        onPressed: onPressed, child: Text(buttomText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)
    );
  }
}
