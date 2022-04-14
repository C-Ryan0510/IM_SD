import 'package:flutter/material.dart';

//where ==>LoginPage()
class LoginPage extends StatelessWidget {
  // const LoginPage({Key? key}) : super(key: key);

  late BuildContext context;

  //show massage by Bar
  void _showSnackBar(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.white,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context){
    this.context = context;
    //TextField Editer
    final nameController = TextEditingController();
    var PassWordController = TextEditingController();
    //用戶資料(username,password)填寫的Textfield()
    final userField = TextField(
        controller: nameController,
        style: TextStyle(fontSize: 30),
        decoration: InputDecoration(
          labelText: '帳號',
          labelStyle: TextStyle(fontSize: 30),
        ),
      );
    final passWordField = TextField(
        controller: PassWordController,//diffent
        style: TextStyle(fontSize: 30),
        decoration: InputDecoration(
          labelText: '密碼',
          labelStyle: TextStyle(fontSize: 30),
        ),
      );
    //登入button
    final btn = ElevatedButton(
      child: Text('登入'),
      /*onPressed()是button必需的*/
      onPressed: () => _showSnackBar(nameController.text+'login'),// for test
    );
    //創建帳號/*need pop to registerPage()*/
    final sign_up = Text('創建帳號',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );

    return Scaffold(/*改排版 image maybe?*/
      body: SafeArea(//no text in Edge of phone
        minimum: const EdgeInsets.symmetric(vertical: 200, horizontal: 50),
        child: Padding(//set position
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(child: userField, width: 200, margin: EdgeInsets.symmetric(vertical: 10),),
                Container(child: passWordField, width: 200, margin: EdgeInsets.symmetric(vertical: 10),),
                Container(child: btn, margin: EdgeInsets.symmetric(vertical: 10),),
                Row(//sign up
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: (() {
                        // Navigator.pushNamed(
                        //   context,
                        //   MyRoutes.signUp,
                        // );
                      }),
                      child: sign_up,
                    ),
                  ],
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}

//useless?
class LoginStateful extends StatefulWidget {
  //constructor
  const LoginStateful({Key? key}) : super(key: key);

  @override//Must override
  State<LoginStateful> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<LoginStateful> {
//   ...
}
