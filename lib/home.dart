import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/components/provider/connectivity_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'elect.dart';
import 'incident.dart';

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void _electReturn() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ElectRtn()));
  }

  void _incidentReturn() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => IncedentReport()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.blue.withOpacity(0.04);
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Colors.blue.withOpacity(0.12);
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: _electReturn,
                  child: Image.asset('assets/images/votes.png'),
                ),
              ),

              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextButton(
                  style: ButtonStyle(
                    //      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    //        borderRadius: BorderRadius.zero,
                    //        side: BorderSide(color: Colors.blueAccent),
                    //      )),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.blue.withOpacity(0.04);
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Colors.blue.withOpacity(0.12);
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: _incidentReturn,
                  child: Image.asset('assets/images/incidents.png'),
                ),
              ),
              // ElevatedButton(
              //    onPressed: _handleLogout,
              //    child: Text("Logout"),
            ],
          ),
        ));
  }
}
