import 'package:flutter/material.dart';

import '../widgets/initial_button.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "PLACE2PLACE",
              style: TextStyle(
                  letterSpacing: 3,
                  color: Color.fromARGB(255, 33, 32, 32),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: "OpenSans"),
            ),
            SizedBox(height: 150),
            InitialButton(
                title: "Login",
                colorBackground: Colors.black,
                colorText: Colors.white),
            InitialButton(
                title: "Sign up",
                colorBackground: Colors.white,
                colorText: Colors.black),
          ],
        ),
      ),
    ));
  }
}
