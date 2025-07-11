import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_pallet.dart';

class AppTheme{
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallet.background
  );
}