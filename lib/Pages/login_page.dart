import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/utils.dart';

//where ==>loginPage()
class loginPage extends StatefulWidget{
  final VoidCallback onClickedSignUp;

  const loginPage({
    Key?key, required this.onClickedSignUp,
  }) : super(key:key);

  @override
  State<loginPage> createState() => _login();
}
class _login extends State<loginPage> {
  //用戶資料(username,password)填寫的Textfield()//須放在widget內才能用
  final mailController = TextEditingController();
  final PassWordController = TextEditingController();
  @override
  void dispose() {
    mailController.dispose();
    PassWordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(/*改再排版(image or animations)*/
    body: SafeArea(//no text in Edge of phone
      minimum: const EdgeInsets.symmetric(horizontal: 50),//pixel overflow cause by keyboard(if too large)
      child: Padding(//set position of box
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Form(
          child: Column(//the box of all
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[//that box
                Container(//name or email box
                    child: TextFormField(
                      controller: mailController,
                      textInputAction: TextInputAction.next,//next textfield
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '輸入帳號',
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:(email)=>email!=null&&!EmailValidator.validate(email)? '請輸入正確mail格式':null,
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 10)
                ),
                Container(
                    child: TextFormField(
                        controller: PassWordController,
                        textInputAction: TextInputAction.done,//deselect textfield
                        obscureText: true,//hide PassWord
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '輸入密碼',
                        )
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 10)
                ),
                Row(//forgot password & sign_in btn
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      child: Text('不記得密碼了嗎?',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),//to Forget()
                      onPressed: (){},
                    ),
                    ElevatedButton(
                      child: Text('登入'),
                      onPressed: signIn,/*2@main.dart return HomeScreen()!*/
                    ),
                  ],
                ),
                RichText(//sign up
                  text: TextSpan(
                    style: TextStyle(fontSize: 12,color: Colors.black),
                    text: '尚未建立帳戶?',
                    children: [
                      TextSpan(text: '               ',),
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
                        text: '創建新的帳號',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent,),),
                    ],
                  ),
                ),
              ]
          ),
        ),
      ),
    ),
  );

  Future signIn() async {
    showDialog(//load time
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mailController.text.trim(),
        password: PassWordController.text.trim(),
      );
    } on FirebaseAuthException catch(e) {
      print(e);
      /*Exceptions print */
      Utils.showSnackBar(e.message);
    }
    //Hide showDialog
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
