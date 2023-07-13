import 'package:flutter/material.dart';

class BottomFavouriteNavBar extends StatefulWidget {
  const BottomFavouriteNavBar({super.key});

  @override
  State<BottomFavouriteNavBar> createState() => _BottomFavouriteNavBarState();
}

class _BottomFavouriteNavBarState extends State<BottomFavouriteNavBar> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        "Welcome to the Favourite Page",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
