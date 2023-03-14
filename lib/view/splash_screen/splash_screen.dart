import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iuvo/generated/assets.dart';
import 'package:iuvo/view/get_start_screen/report_your_issue_screen.dart';
import 'package:iuvo/view/signUp_screen/signup_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 2), ()=>Get.to( ReportYourIssueScreen()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Image.asset(Assets.imageCrimeScene,scale: 3,),),
      ),
    );
  }
}
