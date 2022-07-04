import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Pages/ForgotPasswordPage.dart';
import 'package:untitled/Pages/registerPage.dart';
import 'package:untitled/main.dart';
import 'package:untitled/utils.dart';

//where ==>loginPage()
class loginPage extends StatefulWidget{
  // final Function togglePage;

  const loginPage({Key? key}) : super(key: key);
  // @override
  // loginPage({ required this.togglePage});

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

  final titledText = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(45, 224, 213, 100));
  final BoxOutline = OutlineInputBorder(borderSide: const BorderSide(color: Color.fromRGBO(45, 224, 213, 86), width: 2.0), borderRadius: BorderRadius.circular(200),);
  final ErorrOutline = OutlineInputBorder(borderSide: BorderSide(color: Colors.red.withOpacity(0.86), width: 2.0), borderRadius: BorderRadius.circular(200),);


  @override
  Widget build(BuildContext context) => Scaffold(/*改再排版(image or animations)*/
    resizeToAvoidBottomInset: false,
    // backgroundColor: Colors.greenAccent,
    body: Padding(
      padding: EdgeInsets.all(20),
      child:
      ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(30),
        children: [
          SizedBox(height: 80,),
          // Image.asset('lib/asset/healthcare.png',scale: 2,)
          Center(
            child: Text('居家安全',
              style: titledText,
            ),
          ),
          Center(
            child: Text('Home Secure',
              style: titledText,
            ),
          ),
          SizedBox(height: 100,),
          TextFormField(
            controller: mailController,
            textInputAction: TextInputAction.next,//next textfield
            decoration: InputDecoration(
              enabledBorder: BoxOutline,
              focusedBorder: BoxOutline,
              errorBorder: ErorrOutline,
              focusedErrorBorder: ErorrOutline,
              prefixIcon: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.email_outlined,color: Colors.black,),
              ),
              labelText: '請輸入信箱',
              labelStyle: TextStyle(color: Color.fromRGBO(48, 92, 84, 100),),
            ),
          ),
          SizedBox(height: 30,),
          TextFormField(
              controller: PassWordController,
              textInputAction: TextInputAction.done,//deselect textfield
              obscureText: true,//hide PassWord
              decoration: InputDecoration(
                enabledBorder: BoxOutline,
                focusedBorder: BoxOutline,
                errorBorder: ErorrOutline,
                focusedErrorBorder: ErorrOutline,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.lock_outline_rounded,color: Colors.black,),
                ),
                labelText: '請輸入密碼',
                labelStyle: TextStyle(color: Color.fromRGBO(48, 92, 84, 100),),
              )
          ),
          SizedBox(height: 35,),
          Row(//forgot password & sign_in btn
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                child: Text('忘記密碼?',
                  style: TextStyle(fontSize: 16, color: Color.fromRGBO(48, 92, 84, 100),),
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ForgotPage(),//to Forgot()
                )),
              ),
              TextButton(
                child: Text('註冊新帳號',
                  style: TextStyle(fontSize: 16, color: Color.fromRGBO(48, 92, 84, 100),),
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => registerPage(),
                )),
              ),
            ],
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            child: Text('登入',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold ,color: Color.fromRGBO(48, 92, 84, 100)),),
            onPressed: signIn,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color.fromRGBO(45, 224, 213, 86)),
                ),
              ),
            ),
          ),
        ].toList(),
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

