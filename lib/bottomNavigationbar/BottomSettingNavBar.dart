import 'package:flutter/material.dart';

class BottomSettingNavBar extends StatefulWidget {
  const BottomSettingNavBar({super.key});

  @override
  State<BottomSettingNavBar> createState() => _BottomSettingNavBarState();
}

class _BottomSettingNavBarState extends State<BottomSettingNavBar> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        "Welcome to the Setting page",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
