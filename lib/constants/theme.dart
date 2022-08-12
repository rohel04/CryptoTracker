import 'package:flutter/material.dart';

ThemeData lightTheme=ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 0,
      iconTheme: IconThemeData(
          color: Colors.black
      )
  ),


);

ThemeData darkTheme=ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff15161a),
  appBarTheme: AppBarTheme(
    color: Color(0xff15161a),
    elevation: 0
  )

);