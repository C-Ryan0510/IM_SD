import 'package:flutter/material.dart';
import 'package:untitled/Pages/HomeScreen.dart';
import 'package:untitled/Pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '健康照護',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*test Pages(import needs change)*/
      home: LoginPage(),
      // home: HomeScreen(),
    );
  }
}
