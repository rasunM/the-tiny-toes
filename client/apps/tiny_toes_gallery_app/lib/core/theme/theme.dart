import 'package:flutter/material.dart';
import 'package:tiny_toes_gallery_app/core/theme/app_color_pallet.dart';

class AppTheme {
  static _border([
    Color color = AppColorPallet.textFieldBorder,
    double width = 3,
  ]) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: width),
    borderRadius: BorderRadius.circular(10),
  );

  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColorPallet.backgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: AppColorPallet.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(27),
      enabledBorder: _border(AppColorPallet.textFieldBorder, 1),
      focusedBorder: _border(AppColorPallet.darkTouquios),
      fillColor: AppColorPallet.white,
      filled: true,
    ),
  );
}
