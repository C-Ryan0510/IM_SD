import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils.dart';

import '../main.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  //Keys
  // final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  final BoxOutline = OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(45, 224, 213, 86), width: 2.0), borderRadius: BorderRadius.circular(200),);
  final ErorrOutline = OutlineInputBorder(borderSide: BorderSide(color: Colors.red.withOpacity(0.86), width: 2.0), borderRadius: BorderRadius.circular(200),);

  @override
  Widget build(BuildContext context) => Scaffold(
    // appBar: AppBar(
    //   backgroundColor: Colors.primaries.last,
    //   title: Text('重設密碼'),
    // ),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 100),
      child: Stack(
        children: <Widget>[
          Positioned( left: 50,
            child: Text('重設密碼',style: TextStyle(fontSize: 40, color: Color.fromRGBO(45, 224, 213, 100)),),),
          ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            padding: EdgeInsets.symmetric(horizontal: 40,),
            children: [
              SizedBox(height: 200,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: '請輸入信箱',
                  labelStyle: TextStyle(color: Color.fromRGBO(48, 92, 84, 100),),
                  enabledBorder: BoxOutline,
                  focusedBorder: BoxOutline,
                  errorBorder: ErorrOutline,
                  focusedErrorBorder: ErorrOutline,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.email_outlined,color: Colors.black,),
                  ),
                ),
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:(email)=>email!=null&&!EmailValidator.validate(email)?
                '該電子郵件地址無效':null,
              ),
              SizedBox(height: 30,),//間隔
              ElevatedButton(
                child: Text('送出申請',style: TextStyle(fontSize:20 ,fontWeight: FontWeight.bold ,color: Color.fromRGBO(48, 92, 84, 100),),),
                onPressed: resetPassword,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                      side: BorderSide(color: Color.fromRGBO(45, 224, 213, 86)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),//間隔
            ],
          ),
          IconButton(//To put it on top of ListView so it can be onPressed
            alignment: Alignment.bottomCenter,
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 40,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),

    ),
  );
  Future resetPassword() async{
    showDialog(//load time
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim()
      );
      Utils.showSnackBar('重設密碼的郵件已經寄到您信箱裡');//Success
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);//Failed
      navigatorKey.currentState!.pop();
    }
  }
}
