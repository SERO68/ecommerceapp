import 'dart:async';
import 'package:ecommerceapp/enums.dart';
import 'package:ecommerceapp/screens/login.dart';
import 'package:ecommerceapp/screens/onboarding.dart';
import 'package:ecommerceapp/shared.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      shared.getBool(key: Sharedkeys.hasseen)?
          Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false):
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Onboarding()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Spacer(flex: 1), 
              Center(
                child: Image.asset(
                  'images/logo.png',
                  width: 250,
                ),
              ),
              const Spacer(flex: 1),
              const Text(
                'Connect . Create . Sell',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color.fromARGB(255, 124, 124, 124),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
