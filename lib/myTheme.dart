import 'package:flutter/material.dart';

class MyTheme {
  static Color black = Color(0xff121312);
  static Color white = Color(0xffffffff);
  static Color greyColor = Color(0xff707070);
  static Color primaryColor = Color(0xff004182);
  static Color lighterGreyColor = Color(0xff808080);

  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: greyColor,
        selectedItemColor: MyTheme.white,
        selectedIconTheme: IconThemeData(color: MyTheme.white),
        showSelectedLabels: true,
        showUnselectedLabels: true),

    // appBarTheme: AppBarTheme(
    //     backgroundColor: black,
    //     centerTitle: true,
    //     shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.only(
    //             bottomLeft: Radius.circular(30),
    //             bottomRight: Radius.circular(30)))),

    textTheme: TextTheme(
      titleLarge:
          TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: white),
      titleMedium:
          TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: white),
      titleSmall:
          TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: white),
    ),
  );
}
