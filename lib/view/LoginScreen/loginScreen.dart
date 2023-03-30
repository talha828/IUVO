
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iuvo/components/widget/iuvotextfield.dart';
import 'package:iuvo/components/widget/loading_indicator.dart';
import 'package:iuvo/firebase/auth.dart';
import 'package:iuvo/generated/assets.dart';
import 'package:iuvo/view/signUp_screen/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validation_plus/validate.dart';
import '../../components/constant/constant.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String hintText = "xyz01@gmail.com";
  String labelText = "Email";
  bool obscureText = true;
  bool isLoading=false;
  setLoading(bool value){
    setState(() {
      isLoading=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height:height ,
                padding: EdgeInsets.symmetric(
                    vertical: width * 0.04, horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: width * 0.04,
                    ),
                    Image.asset(
                      Assets.imageLogin,
                      scale: 1.2,
                    ),
                    SizedBox(
                      height: width * 0.1,
                    ),
                    Text(
                      "Login",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width * 0.08),
                    ),
                    SizedBox(
                      height: width * 0.1,
                    ),
                    IuvoTextField(
                        obscureText: false,
                        controller: email,
                        hintText: hintText,
                        labelText: labelText),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    IuvoTextField(
                      controller: password,
                      hintText: "pass@11",
                      labelText: "Password",
                      obscureText: obscureText,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: width * 0.04),
                        child: InkWell(
                            onTap: () => setState(() {
                              obscureText = obscureText ? false : true;
                            }),
                            child: FaIcon(obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash)),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.06,
                    ),
                    //BTextField(controller: controller, hintText: "pass @11", labelText: "Password"),
                    const Text(
                      "Forget Password?",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: appThemeColor),
                    ),
                    SizedBox(
                      height: width * 0.1,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Auth.login(email: email.text, password: password.text, width: width,setLoading:  (bool value){setState(() {isLoading=value;});});
                        },
                        child: const Text("Login Now")),
                    SizedBox(
                      height: width * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Create an Account?",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () => Get.to(const SignUpScreen()),
                          child: const Text(
                            " SignUp",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              isLoading
                  ? const Positioned.fill(child: LoadingIndicator())
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}