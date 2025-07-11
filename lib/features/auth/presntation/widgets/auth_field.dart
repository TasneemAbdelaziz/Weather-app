import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_pallet.dart';

class AuthField extends StatelessWidget {
  String headName;
  TextEditingController controller;
  bool obscureText;
   AuthField({super.key,required this.headName,required this.controller,this.obscureText=false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headName,style: TextStyle(fontWeight: FontWeight.bold),),
        TextFormField(
          obscureText:obscureText ,
          validator: (value){
            if(value!.isEmpty){
              return "$headName is messing";
            }
            return null;
          },
          controller: controller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: AppPallet.buttonColor),
              ),
              focusedErrorBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: AppPallet.buttonColor),
              ),
              errorBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.red),
              ) ,
              filled: true,
              fillColor: AppPallet.formField
          ),
        ),
      ],
    );
  }
}
