import 'package:e_learning/screens/video_screen.dart';
import 'package:e_learning/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Learning Online Courses App',
      debugShowCheckedModeBanner: false,
      // theme: Constants.lighTheme(context),
      home: HomeScreen(),
    );
  }
}
