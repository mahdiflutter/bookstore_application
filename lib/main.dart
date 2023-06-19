import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/screens/app/setting.dart';
import 'package:bookstore_app/screens/categories.dart';
import 'package:bookstore_app/screens/home.dart';
import 'package:bookstore_app/screens/product.dart';
import 'package:bookstore_app/screens/user/basket.dart';
import 'package:bookstore_app/screens/user/profile.dart';
import "package:flutter/material.dart";

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedPage = 2;
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
              fontFamily: 'vazirbold'),
          labelMedium: const TextStyle(
            color: Colors.red,
            decoration: TextDecoration.lineThrough,
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
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 1,
          currentIndex: selectedPage,
          selectedItemColor: CustomColors.mainBlue,
          unselectedItemColor: CustomColors.mainGrayText,
          unselectedIconTheme: IconThemeData(
            color: CustomColors.mainGrayText,
            size: 30,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'vazirbold',
            color: CustomColors.mainBlue,
          ),
          selectedIconTheme: IconThemeData(
            color: CustomColors.mainBlue,
            size: 30,
          ),
          selectedLabelStyle: TextStyle(
            fontFamily: 'vazirbold',
            color: CustomColors.mainBlue,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (page) {
            setState(() {
              selectedPage = page;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              activeIcon: Icon(
                Icons.settings,
              ),
              label: 'تنظیمات',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,
              ),
              activeIcon: Icon(
                Icons.category,
              ),
              label: 'دسته بندی',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              activeIcon: Icon(
                Icons.home,
              ),
              label: 'خانه',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              activeIcon: Icon(
                Icons.shopping_bag,
              ),
              label: 'سبد خرید',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
              ),
              activeIcon: Icon(
                Icons.person,
              ),
              label: 'پروفایل',
            ),
          ],
        ),
        body: IndexedStack(
          index: selectedPage,
          children: getScreens(),
        ),
      ),
    );
  }

  List<Widget> getScreens() {
    return const [
      Directionality(
        textDirection: TextDirection.rtl,
        child: SettingsAppScreen(),
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: CategoriesScreen(),
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: HomeScreen(),
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: BasketScreen(),
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: ProfileScreen(),
      ),
    ];
  }
}
