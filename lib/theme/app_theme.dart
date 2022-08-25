import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;

  static final ThemeData lighTheme = ThemeData.light().copyWith(
    // Color primario
    primaryColor: primary,

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
      centerTitle: true,
    ),

    // TextButton Theme
    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(primary: primary),
    // ),

    // FloatingActionButton Theme
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: primary,
    //   elevation: 0,
    // ),

    // ElevatedButton Theme
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     primary: primary,
    //     shape: const StadiumBorder(),
    //     elevation: 0,
    //   ),
    // ),

    // TextFormField Theme
    // inputDecorationTheme: const InputDecorationTheme(
    //   floatingLabelStyle: TextStyle(color: primary),
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: primary),
    //     borderRadius: BorderRadius.only(
    //         bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: primary),
    //     borderRadius: BorderRadius.only(
    //         bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
    //   ),
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.only(
    //         bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
    //   ),
    // ),
  );
}
