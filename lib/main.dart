import 'package:flutter/material.dart';
import 'package:untitled/Pages/HomeScreen.dart';
import 'package:untitled/Pages/login_page.dart';
import 'Pages/registerPage.dart';

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
      // home: null,
      home: loginPage(),
      // home: HomeScreen(),
      initialRoute: '/',
      routes: {//導覽頁面
        //to loginPage 'login'
        '/login': (context) => const loginPage(),
        //to registerPage Use 'register'
        '/register': (context) => const registerPage(),
      },
    );
  }
}
