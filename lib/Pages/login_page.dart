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
    //登入button test
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
        minimum: const EdgeInsets.symmetric(horizontal: 50),//pixel overflow cause by keyboard(if too large)
        child: Padding(//set position of box
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[//that box
                  Container(child: userField, alignment: Alignment.center, margin: EdgeInsets.symmetric(vertical: 10)),
                  Container(child: passWordField, alignment: Alignment.center, margin: EdgeInsets.symmetric(vertical: 10)),
                  Row(//forgot password & sign_in btn
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: (() {//to forgotPassword

                        }),
                        child: Text('不記得密碼了嗎?', style: TextStyle(fontSize: 18),),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
