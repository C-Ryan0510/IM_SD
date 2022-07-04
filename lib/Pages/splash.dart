import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    _ToHome();
  }
  _ToHome() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainScreen()),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlueAccent,
      body: Container(
        decoration: BoxDecoration(//Only PageWidget(Container)背景
          gradient: LinearGradient(//漸層色
            colors: [
              Color.fromRGBO(45, 224, 213, 100),//begin
              Color.fromRGBO(45, 224, 213, 50),
              Color.fromRGBO(45, 224, 213, 0), //end
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            child: Image.asset('lib/asset/homecare.png',
              scale: 3,
            ),
          ),
        ),
      ),
    );
  }

}
