import 'package:bookstore_app/screens/authentication/login_1.dart';
import 'package:bookstore_app/screens/authentication/login_2.dart';
import 'package:bookstore_app/screens/home.dart';
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
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'vazirbold',
            fontSize: 18,
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            color: Colors.black,
            fontFamily: 'vazirlight',
            fontSize: 16,
          ),
          displaySmall: TextStyle(
            fontFamily: 'vazirlight',
            color: Color(0xff858585),
            fontSize: 14,
          ),
          labelLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'vazirbold',
            fontSize: 16,
          ),
        ),
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
        child: HomeScreen(),
      ),
    );
  }
}
