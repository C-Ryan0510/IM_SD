import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:untitled/utils.dart';

class registerPage extends StatefulWidget{
  final Function() onClickedSignIn;

  const registerPage({
    Key?key, required this.onClickedSignIn,
  }) : super(key:key);

  @override
  State<StatefulWidget> createState() => _registerState();
}

class _registerState extends State<registerPage>{
  final formKey = GlobalKey<FormState>();
  //text Editor
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final passcheckController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    passcheckController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>Scaffold(
    body: Stack(
        children:[
          SafeArea(//no text in Edge of phone
            minimum: const EdgeInsets.symmetric(horizontal: 50),//pixel overflow cause by keyboard(if too large)
            child: Padding(//set position of box
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(//the box of all
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[//that box
                      Container(child: TextFormField(
                        controller: mailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(labelText: '請輸入Email帳號',
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) /*email_validator needed add in pubspec.yaml*/
                        => email != null&& !EmailValidator.validate(email)? '請輸入正確的mail':null,
                      ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: 10)
                      ),
                      Container(child: TextFormField(
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration: InputDecoration(labelText: '請設立密碼',
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                        ? '請設立長度最少為6的密碼' : null,
                      ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: 10)
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          ElevatedButton(//any type of button
                            child: Text('創建帳戶', style: TextStyle(fontSize: 20),),
                            onPressed: SigUp,
                          )
                        ],
                      ),
                      RichText(//sign up
                        text: TextSpan(
                          style: TextStyle(fontSize: 12,color: Colors.black),
                          text: '已經有帳戶了?',
                          children: [
                            TextSpan(text: '               ',),
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignIn,
                              text: '返回登入畫面',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent,),),
                          ],
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
        ]
    ),
  );
  Future SigUp() async {
    //Formfields 的狀態都有效(validate)的話，放行
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;//YOU SHALL NOT PASS!!!

    showDialog(//load time
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      /*Exception 帳號已存在*/
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
