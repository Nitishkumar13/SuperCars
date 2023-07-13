import 'package:flutter/material.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController textController) {
  return TextField(
    controller: textController,
    obscureText: isPasswordType,
    decoration: InputDecoration(
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: text,
        labelStyle: const TextStyle(color: Colors.white)),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

ElevatedButton myButton(String text, Function onTap) {
  return ElevatedButton(
    onPressed: () {
      onTap();
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 235, 198, 16),
      elevation: 10,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Text(text),
  );
}
