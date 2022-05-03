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
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.primaries.last,
      title: Text('重設密碼'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('請輸入您記得的Email電子信箱',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28,color: Colors.blueGrey),
            ),
            SizedBox(height: 30,),//間隔
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email信箱名稱',border: OutlineInputBorder(),),
              textInputAction: TextInputAction.done,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator:(email)=>email!=null&&!EmailValidator.validate(email)?
              '該電子郵件地址無效':null,
            ),
            SizedBox(height: 30,),//間隔
            ElevatedButton.icon(icon: Icon(Icons.email_outlined),
              label: Text('重設密碼',style: TextStyle(fontSize: 20),),
              onPressed: () => resetPassword(),
            ),
          ],
        ),
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
