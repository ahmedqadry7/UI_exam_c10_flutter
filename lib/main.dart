import 'package:flutter/material.dart';
import 'package:ui_exam/home_screen.dart';
import 'package:ui_exam/screens/first_screen.dart';
import 'package:ui_exam/screens/second_screen.dart';
import 'package:ui_exam/screens/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ThirdScreen.routeName,
      routes: {
        FirstScreen.routeName: (context) => FirstScreen(),
        SecondScreen.routeName: (context) => SecondScreen(),
        ThirdScreen.routeName: (context) => ThirdScreen(),
        HomeScreen.routeName:(context) => HomeScreen(),
      },
    );
  }
}
