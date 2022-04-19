import 'package:flutter/material.dart';

class registerPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    //base data
    final account = TextField(
       decoration: InputDecoration(
         border: OutlineInputBorder(),
         hintText: '請輸入帳號',
       ),
    );
    final password = TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: '請輸入密碼',
      ),
    );
    final comfirmbtn = ElevatedButton(//any type of button
      onPressed: () {
        // save textfield to personal Data(table)
        // redirect to loginPage()
      },
      child: Text('確認', style: TextStyle(fontSize: 20),),
    );


    // 老人或照護者
    var typeAcc = RadioListTile(value: null, onChanged: null, groupValue: null,);


    return Scaffold(
      body: SafeArea(//no text in Edge of phone
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
                      // typeAcc,//can't be see
                      comfirmbtn,
                    ],
                  ),
                ]
            ),
          ),
        ),
      ),
    );  }

}

class _PageLoading extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}
