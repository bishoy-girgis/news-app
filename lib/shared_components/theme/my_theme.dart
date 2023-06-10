import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/shared_components/theme/color.dart';

class MyTheme {
  static ThemeData LightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      toolbarHeight: 90,
      elevation: 1,
      color: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
          color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
      bodyMedium: GoogleFonts.poppins(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
      bodySmall: GoogleFonts.exo(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
    ),
    drawerTheme: DrawerThemeData(
      
    )
  );
}
