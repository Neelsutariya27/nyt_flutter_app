import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  ///HEX COLORS
  static MaterialColor materialPrimaryColor = MaterialColor(
    primaryColor.value,
    const <int, Color>{
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    },
  );

  ///PRIMARY COLOR
  static const Color primaryColor = Color(0xffBBCB2F);

  ///MATERIAL COLOR
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color redColor = Color(0xffFF0000);
  static const Color greenColor = Color(0xff008000);
  static const Color blueColor = Color(0xff0000FF);
  static const Color yellowColor = Color(0xffFFFF00);
  static const Color pinkColor = Color(0xffFF00FF);
  static const Color skyColor = Color(0xff00FFFF);
  static const Color orangeColor = Color(0xffFFA500);
  static const Color purpleColor = Color(0xffA020F0);
  static const Color greyColor = Color(0xff808080);
  static const Color transparentColor = Colors.transparent;

  ///APP COLORS
  static const Color scaffoldColor = Color(0xffF3F2E7);
  static const Color cardBgColor = Color(0xffEAE8D6);
  static const Color searchBgColor = Color(0xffFFFA93);
  static const Color textColor = Color(0xff051B09);

  ///THEME
  static ThemeData appTheme = ThemeData(
      useMaterial3: false,
      primarySwatch: materialPrimaryColor,
      scaffoldBackgroundColor: scaffoldColor,
      hoverColor: transparentColor,
      splashColor: transparentColor,
      highlightColor: transparentColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: whiteColor),
          titleTextStyle:
              TextStyle(fontSize: 20, color: whiteColor, fontWeight: FontWeight.w600, fontFamily: "Poppins")),
      bottomAppBarTheme: const BottomAppBarTheme(color: whiteColor));
}
