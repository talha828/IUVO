import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iuvo/generated/assets.dart';
import 'package:iuvo/view/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 2), ()=>Get.to(const SignUpScreen()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Image.asset(Assets.imageLogo),),
      ),
    );
  }
}
