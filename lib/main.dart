import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/screens/app/setting.dart';
import 'package:bookstore_app/screens/authentication/login_1.dart';
import 'package:bookstore_app/screens/authentication/login_2.dart';
import 'package:bookstore_app/screens/categories.dart';
import 'package:bookstore_app/screens/home.dart';
import 'package:bookstore_app/screens/product.dart';
import 'package:bookstore_app/screens/products_by_category.dart';
import 'package:bookstore_app/screens/user/basket.dart';
import 'package:bookstore_app/screens/user/profile.dart';
import "package:flutter/material.dart";

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontFamily: 'vazirbold',
              fontSize: 18,
              color: Colors.black,
            ),
            displayMedium: const TextStyle(
              color: Colors.black,
              fontFamily: 'vazirlight',
              fontSize: 16,
            ),
            displaySmall: const TextStyle(
              fontFamily: 'vazirlight',
              color: Color(0xff858585),
              fontSize: 14,
            ),
            labelLarge: const TextStyle(
              color: Colors.white,
              fontFamily: 'vazirbold',
              fontSize: 16,
            ),
            titleLarge: const TextStyle(
              color: Colors.white,
              fontFamily: 'vazirbold',
              fontSize: 30,
            ),
            titleMedium: const TextStyle(
              fontFamily: 'vazirbold',
              color: Colors.black,
              fontSize: 16,
            ),
            titleSmall: const TextStyle(
              fontFamily: 'vazirlight',
              fontSize: 14,
              color: Colors.black,
            ),
            labelSmall: TextStyle(
                color: CustomColors.mainBlue,
                fontSize: 14,
                fontFamily: 'vazirbold')),
        inputDecorationTheme: const InputDecorationTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff3B5EDF),
            elevation: 1,
          ),
        ),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: ProductScreen(),
      ),
    );
  }
}
