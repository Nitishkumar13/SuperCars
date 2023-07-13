import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_logout/screens/signInScreen.dart';
import 'package:login_logout/screens/signupScreen.dart';

import '../reusablewidgets/reusablewidgets.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(229, 226, 243, 244),
        appBar: AppBar(
          title: const Text(
            "Super Cars",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 30,
              right: 20,
              child: SizedBox(
                height: 200,
                width: 350,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: myButton("Signin", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      
                      },
                      child: const Text("Create An Account"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Forgot Password?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
