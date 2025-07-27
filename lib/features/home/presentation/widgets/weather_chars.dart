import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_pallet.dart';

class WeatherChars extends StatelessWidget {
  IconData iconData;
  double number;
  String kind;
  String UnitOfMeasure;
   WeatherChars({super.key,required this.iconData,required this.number,required this.kind,required this.UnitOfMeasure});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:const Color(0xFF17203A), // Set the background color of the container
            borderRadius: BorderRadius.circular(20.0), // Apply a circular border radius
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: constraints.maxHeight * 0.35,),
              Text.rich(
                TextSpan(
                  text: number.toString(), // الرقم الأساسي
                  style: TextStyle(
                    fontSize: constraints.maxHeight * 0.15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // اختياري
                  ),
                  children: [
                    TextSpan(
                      text: UnitOfMeasure, // الوحدة
                      style: TextStyle(
                        fontSize: constraints.maxHeight * 0.12, // حجم أصغر
                        fontWeight: FontWeight.normal,
                        color: Colors.white, // أو نفس لون الرقم
                      ),
                    ),
                  ],
                ),
              ),
              Text(kind,style: TextStyle(fontSize: constraints.maxHeight * 0.13,))
            ],
          ),
        );
      }

    );
  }
}
