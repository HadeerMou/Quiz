import 'package:flutter/material.dart';
import 'package:quiz/Homescreen.dart';
import 'package:get/get.dart';
import 'package:quiz/View/quizscreen.dart';
import 'package:quiz/View/ResultScreen.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: HomeScreen(),
      getPages: [
        GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
        GetPage(name: QuizScreen.routeName, page: () => QuizScreen()),
        GetPage(name: ResultScreen.routeName, page: () => ResultScreen()),
      ],
      );
  }
}