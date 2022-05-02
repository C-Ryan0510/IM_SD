import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:untitled/utils.dart';
import 'package:untitled/accountAuth.dart';
import 'Pages/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    scaffoldMessengerKey: Utils.messengerKey,
    navigatorKey: navigatorKey,//GlobalKey
    title: '健康照護',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MainScreen(),//顯現主頁
    // initialRoute: '/',
    // routes: { //導覽頁面路徑}
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  => Scaffold(/*此代替導覽路徑*/
    body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),//Stream check STATE
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);/*Loading*/
          }else if(snapshot.hasError){
            return Center(child: Text('Someting went wrong!'),);
          }else if(snapshot.hasData){
            return HomeScreen();
          } else {//if press sign out or hasn't sign in
            return AuthPageSwitch();
          }
        }
    ),
  );
}
