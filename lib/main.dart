import 'package:flutter/material.dart';
import '/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI Calculator",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0f0044),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: Color(0xff0f0044),
        ),
      ),
      home: Home(),
    );
  }
}
