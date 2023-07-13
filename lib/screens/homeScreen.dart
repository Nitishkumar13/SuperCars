import 'package:flutter/material.dart';
import 'package:login_logout/bottomNavigationbar/BottomSettingNavBar.dart';
import 'package:login_logout/bottomNavigationbar/BottomShoppingCartBar.dart';

import '../bottomNavigationbar/BottomFavoriteNav.dart';
import '../bottomNavigationbar/BottomNavbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> screens = const [
    BottomNavigationHome(),
    BottomFavouriteNavBar(),
    BottomShoppingCartBar(),
    BottomSettingNavBar(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(229, 226, 243, 244),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.black,
          elevation: 0,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: "",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "",
              backgroundColor: Colors.transparent,
            ),
          ]),
    );
  }
}
