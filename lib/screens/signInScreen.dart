import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_logout/screens/signupScreen.dart';
import '../reusablewidgets/reusablewidgets.dart';
import 'homeScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(229, 226, 243, 244),
      appBar: AppBar(
        title: const Text(
          "Sign In",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 108, 108, 83),
              borderRadius: BorderRadius.circular(20)),
          height: 400,
          width: 400,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              reusableTextField(
                  "email Address", Icons.person_outlined, false, emailAddress),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Password", Icons.lock, true, password),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: 500,
                child: myButton(
                  "Log in",
                  () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailAddress.text, password: password.text)
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen())))
                        .onError((error, stackTrace) {
                      Fluttertoast.showToast(
                          msg: "Wrong password or email",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 20);
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  const Text("Don't have account,"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        "SignUp here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
