import 'package:flutter/material.dart';
import 'package:untitled/Firebase/authentication.dart';
import 'package:untitled/Pages/registerPage.dart';

//where ==>loginPage()
class loginPage extends StatefulWidget{
  const loginPage({Key?key}) : super(key:key);

  @override
  State<loginPage> createState() => _login();
}
class _login extends State<loginPage> {
  //TextField Editer
  var nameController = TextEditingController();
  var PassWordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    PassWordController.dispose();
    super.dispose();
  }
  String getEmail(){
    return nameController.text;
  }
  TextEditingController getPassword(){
    return PassWordController;
  }
  @override
  Widget build(BuildContext context) {

    /*用戶資料(username,password)填寫的Textfield()*/
    final userField = TextField(
      controller: nameController,
      style: TextStyle(fontSize: 30),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: '輸入帳號',
        labelStyle: TextStyle(fontSize: 20),
      ),
    );
    final passWordField = TextField(
      controller: PassWordController,//different
      style: TextStyle(fontSize: 30),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: '輸入密碼',
        labelStyle: TextStyle(fontSize: 20),
      ),
    );
    //登入button test
    final btn = ElevatedButton(
      child: Text('登入'),
      /*onPressed()是button必需的*/
      onPressed: () => null,
    );
    //忘記密碼text
    final forgot  = Text('不記得密碼了嗎?',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
    //創建帳號text
    final sign_up = Text('創建帳號',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );

    return Scaffold(/*改再排版(image or animations)*/
      body: SafeArea(//no text in Edge of phone
        minimum: const EdgeInsets.symmetric(horizontal: 50),//pixel overflow cause by keyboard(if too large)
        child: Padding(//set position of box
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Center(
            child: Column(//the box of all
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[//that box
                  Container(child: userField, alignment: Alignment.center, margin: EdgeInsets.symmetric(vertical: 10)),
                  Container(child: passWordField, alignment: Alignment.center, margin: EdgeInsets.symmetric(vertical: 10)),
                  Row(//forgot password & sign_in btn
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: (() {//to forgotPassword()

                        }),
                        child: forgot,
                      ),
                      btn,//alignment: Alignment.centerRight, margin: EdgeInsets.symmetric(vertical: 10),
                    ],
                  ),
                  Row(//sign up
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('尚未建立帳戶?'),
                      TextButton(
                        onPressed: (() {//to registerPage()
                          Navigator.pushNamed(context, '/register',);
                        }),
                        child: sign_up,
                      ),
                    ],
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
