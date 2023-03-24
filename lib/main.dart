import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iuvo/view/get_start_screen/build_your_community_screen.dart';
import 'package:iuvo/view/get_start_screen/report_your_issue_screen.dart';
import 'package:iuvo/view/main_screen/main_screen.dart';
import 'package:iuvo/view/splash_screen/splash_screen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xff404258)),
          primaryTextTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme
          ),
          textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme
          )
      ),
      home:const  MainScreen(),
    );
  }
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
