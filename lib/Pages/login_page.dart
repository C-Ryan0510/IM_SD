import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

//where ==>loginPage()
class loginPage extends StatefulWidget{
  const loginPage({Key?key}) : super(key:key);

  @override
  State<loginPage> createState() => _login();
}
class _login extends State<loginPage> {
  //用戶資料(username,password)填寫的Textfield()//須放在widget內才能用
  final nameController = TextEditingController();
  final PassWordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    PassWordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(/*改再排版(image or animations)*/
      body: SafeArea(//no text in Edge of phone
        minimum: const EdgeInsets.symmetric(horizontal: 50),//pixel overflow cause by keyboard(if too large)
        child: Padding(//set position of box
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Center(
            child: Column(//the box of all
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[//that box
                  Container(//name or email box
                      child: TextField(
                        controller: nameController,
                        style: TextStyle(fontSize: 20),
                        textInputAction: TextInputAction.next,//next textfield
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '輸入帳號',
                          labelStyle: TextStyle(fontSize: 25),
                        ),
                      ),
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 10)
                  ),
                  Container(
                      child: TextField(
                          controller: PassWordController,
                          style: TextStyle(fontSize: 20),
                          textInputAction: TextInputAction.done,//deselect textfield
                          obscureText: true,//hide PassWord
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '輸入密碼',
                            labelStyle: TextStyle(fontSize: 25),
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
                  Row(//sign up
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('尚未建立帳戶?'),
                      TextButton(
                        child: Text('創建帳號',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pushNamed('/register'),
                      ),
                    ],
                  ),
                ]
            ),
          ),
        ),
      ),
  );

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: nameController.text.trim(),
        password: PassWordController.text.trim(),
      );
    } on FirebaseAuthException catch(e) {
      print(e);
    }
    //Hide showDialog
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
