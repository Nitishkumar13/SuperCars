import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_logout/screens/homeScreen.dart';

import '../reusablewidgets/reusablewidgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(229, 226, 243, 244),
      appBar: AppBar(
        title: const Text(
          "SignUp",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 108, 108, 83),
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(20),
          height: 400,
          width: 400,
          child: Column(
            children: [
              reusableTextField("Name", Icons.edit, false, name),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Email address", Icons.email_outlined, false, email),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Password", Icons.lock, true, password),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(right: 30),
                height: 40,
                width: 300,
                child: myButton(
                  "Sign Up",
                  () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email.text, password: password.text)
                        .then(
                          (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          ),
                        )
                        .onError((error, stackTrace) {
                      Fluttertoast.showToast(
                          msg: "User Alread exist, Please login",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 20);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
