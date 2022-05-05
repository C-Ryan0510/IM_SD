import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Pages/ForgotPasswordPage.dart';
import 'package:untitled/main.dart';
import 'package:untitled/utils.dart';

//where ==>loginPage()
class loginPage extends StatefulWidget{
  final Function togglePage;

  loginPage({ required this.togglePage});

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
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.greenAccent,
    body: Center(
      child: ListView(
        shrinkWrap: true,
        reverse: true,
        padding: EdgeInsets.all(32),
        children: [
          Image.asset('lib/asset/healthcare.png',scale: 2,),
          Positioned(child: Text('帳號登入',style: TextStyle(fontSize: 30),),),
          SizedBox(height: 16,),
          TextFormField(
            controller: mailController,
            textInputAction: TextInputAction.next,//next textfield
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '輸入電子信箱',
            ),
          ),
          SizedBox(height: 16,),
          TextFormField(
              controller: PassWordController,
              textInputAction: TextInputAction.done,//deselect textfield
              obscureText: true,//hide PassWord
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '輸入密碼',
              )
          ),
          SizedBox(height: 16,),
          Row(//forgot password & sign_in btn
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text('不記得密碼了嗎?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    color: Colors.blueAccent,
                  ),
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ForgotPage(),//to Forgot()
                )),
              ),
              ElevatedButton(
                child: Text('登入'),
                onPressed: signIn,/*@main.dart return HomeScreen()!*/
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(//sign up
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('尚未建立帳戶?',style: TextStyle(fontSize: 12,color: Colors.black),),
                GestureDetector(//byPass a false(value) to accountAuth()
                  onTap: () { widget.togglePage();},//Switch registerPage
                  child: Text('創建新的帳號',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent,),
                  ),
                ),
              ]
          ),
        ].reversed.toList(),
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

