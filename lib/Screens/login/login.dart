import 'package:flutter/material.dart';
import 'package:login_ui/Screens/register/register.dart';
import 'package:login_ui/api.dart';
import 'package:login_ui/components/background.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_ui/elect.dart';
import 'package:login_ui/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  String error = '';

  String message = '';

  final _storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            height: size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    child: Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA),
                          fontSize: 24),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.035),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      validator: (String? val) =>
                          val!.isEmpty ? 'Please enter email' : null,
                      decoration: InputDecoration(labelText: "Username"),
                      controller: emailController,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      validator: (String? val) =>
                          val!.isEmpty ? 'Please enter password' : null,
                      decoration: InputDecoration(labelText: "Password"),
                      controller: passwordController,
                      obscureText: true,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
                    ),
                  ),
                  Center(
                    child: Text(
                      error,
                      style: TextStyle(
                          color: Color.fromRGBO(216, 181, 58, 1.0),
                          fontSize: 14.0),
                    ),
                  ),
                  SizedBox(height: size.height * 0.035),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        side: BorderSide(width: 3, color: Colors.brown),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(0),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var email = emailController.text;
                          var password = passwordController.text;
                          //  setState(() {
                          //        message='Please Wait...';
                          //  });
                          var rsp = await loginUser(email, password);
                          print(rsp);
                          var data = new Map<String, dynamic>.from(rsp['data']);
                          if (data["token"] != null) {
                            String _tokenValue = data["token"];
                            print(_tokenValue);
                            await _storage.write(
                                key: 'token', value: _tokenValue);

                            var token = await _storage.read(key: 'token');
                            print(token);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ElectRtn()));
                          } else {
                            setState(() => error = 'Please supply valid email');
                          }
                        }

                        //ScaffoldMessenger.of(context).showSnackBar(
                        //const SnackBar(content: Text('You clicked ElevatedButton.')));
                      },
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()))
                      },
                      child: Text(
                        "Don't Have an Account? Sign up",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2661FA)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
