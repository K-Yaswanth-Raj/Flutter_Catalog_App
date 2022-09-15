import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    
    cardColor: MyTheme.lightColor,
    canvasColor: MyTheme.creamColor,
    
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        //textTheme: Theme.of(context).textTheme,
        primarySwatch: Colors.deepPurple,
        //fontFamily: GoogleFonts.sacramento().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );
  

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkColor = Colors.black87;
  static Color lightColor = Colors.white;
  static Color greyColor = Vx.gray900;
}
