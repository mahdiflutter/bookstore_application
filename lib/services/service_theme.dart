import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontFamily: 'vazirbold',
        fontSize: 16,
        color: Colors.black,
      ),
      displayMedium: const TextStyle(
        color: Colors.black,
        fontFamily: 'vazirlight',
        fontSize: 14,
      ),
      displaySmall: const TextStyle(
        fontFamily: 'vazirlight',
        color: Color(0xff858585),
        fontSize: 12,
      ),
      labelLarge: const TextStyle(
        color: Colors.white,
        fontFamily: 'vazirbold',
        fontSize: 14,
      ),
      titleLarge: const TextStyle(
        color: Colors.white,
        fontFamily: 'vazirbold',
        fontSize: 25,
      ),
      titleMedium: const TextStyle(
        fontFamily: 'vazirbold',
        color: Colors.black,
        fontSize: 14,
      ),
      titleSmall: const TextStyle(
        fontFamily: 'vazirlight',
        fontSize: 12,
        color: Colors.black,
      ),
      labelSmall: TextStyle(
          color: CustomColors.mainBlue, fontSize: 14, fontFamily: 'vazirbold'),
      labelMedium: const TextStyle(
        color: Colors.red,
        decoration: TextDecoration.lineThrough,
        fontFamily: 'vazirbold',
        fontSize: 14,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff3B5EDF),
        elevation: 1,
      ),
    ),
  );
}
