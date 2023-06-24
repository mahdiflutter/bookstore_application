import 'package:bookstore_app/bloc/category/category_bloc.dart';
import 'package:bookstore_app/bloc/home/home_bloc.dart';
import 'package:bookstore_app/constants/custom_colors.dart';
import 'package:bookstore_app/data/model/order.dart';
import 'package:bookstore_app/screens/app/setting.dart';
import 'package:bookstore_app/screens/categories.dart';
import 'package:bookstore_app/screens/home.dart';
import 'package:bookstore_app/screens/user/basket.dart';
import 'package:bookstore_app/screens/user/profile.dart';
import 'package:bookstore_app/services/service_locator.dart';
import 'package:bookstore_app/services/service_theme.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(OrderModelAdapter());
  await Hive.openBox<OrderModel>('orders');
  await initGetIt();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPage = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 1,
        currentIndex: selectedPage,
        selectedItemColor: CustomColors.mainBlue,
        unselectedItemColor: CustomColors.mainGrayText,
        unselectedFontSize: 13,
        selectedFontSize: 13,
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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: IndexedStack(
          index: selectedPage,
          children: getScreens(),
        ),
      ),
    );
  }

  List<Widget> getScreens() {
    return [
      SettingsAppScreen(),
      BlocProvider(
        create: (context) => CategoryBloc(),
        child: const CategoriesScreen(),
      ),
      BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomeScreen(),
      ),
      BasketScreen(),
      ProfileScreen(),
    ];
  }
}
