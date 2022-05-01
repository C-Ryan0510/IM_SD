import 'package:flutter/material.dart';
import 'package:untitled/Pages/login_page.dart';


class registerPage extends StatefulWidget{
  const registerPage({Key?key}) : super (key:key);
  static const String routeName = "/PageLoading";
  @override
  State<StatefulWidget> createState() => _registerState();
}

class _registerState extends State<registerPage>{
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //base data
    final account = TextField(
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: '請輸入帳號',
      ),
    );
    final password = TextField(
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: '請輸入密碼',
      ),
    );
    final comfirmbtn = ElevatedButton(//any type of button
      child: Text('確認', style: TextStyle(fontSize: 20),),
      onPressed: (() {
        /*save textfield to personal Data(table)*/
        // if(account.onSubmitted&&password.onSubmitted){
        //   Navigator.pop(context);
        // }else{
        // }
        Navigator.pop(context);
      }),
    );

    // 老人或照護者
    var typeAcc = RadioListTile(value: null, onChanged: null, groupValue: null,);

    return Scaffold(
      body: Stack(
          children:[
            IconButton(//show back Arrow/*can apply on every page*/
              icon: Icon(Icons.arrow_back,color: Colors.black,),
              onPressed: () => Navigator.pop(context),//
            ),
            SafeArea(//no text in Edge of phone
              minimum: const EdgeInsets.symmetric(horizontal: 50),//pixel overflow cause by keyboard(if too large)
              child: Padding(//set position of box
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: Column(//the box of all
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[//that box
                        Container(child: account, alignment: Alignment.center, margin: EdgeInsets.symmetric(vertical: 10)),
                        Container(child: password, alignment: Alignment.center, margin: EdgeInsets.symmetric(vertical: 10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            comfirmbtn,
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
