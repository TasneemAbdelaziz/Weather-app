import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:weather_app/core/theme/app_pallet.dart';

void showWeatherAlert(BuildContext context, int result) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.custom,
    barrierDismissible: true,
    backgroundColor: const Color(0xFF17203A),
    title: "Weather Condition",
    titleColor: Colors.white,
    customAsset: 'assets/images/Weather Day - mist.gif',
    confirmBtnText: 'OK',
    confirmBtnColor: AppPallet.background,
    onConfirmBtnTap: () {
      Navigator.pop(context);
    },
    widget: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        result > 0
            ? "Weather is Good\nYou can go out!"
            : "Weather is Bad\nBetter to stay in.",
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
      ),
    ),
  );
}
