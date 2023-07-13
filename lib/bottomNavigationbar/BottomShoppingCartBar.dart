import 'package:flutter/material.dart';

class BottomShoppingCartBar extends StatefulWidget {
  const BottomShoppingCartBar({super.key});

  @override
  State<BottomShoppingCartBar> createState() => _BottomShoppingCartBarState();
}

class _BottomShoppingCartBarState extends State<BottomShoppingCartBar> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        "Welcome to the Shopping cart page",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
