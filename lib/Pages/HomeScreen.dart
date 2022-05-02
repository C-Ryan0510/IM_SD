import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//main()==>HomeScreen()
class HomeScreen extends StatefulWidget {
  //constructor
  const HomeScreen({Key? key}) : super(key: key);
  @override//Must override
  State<HomeScreen> createState() => _HomeStateful();
}
class _HomeStateful extends State<HomeScreen> {
  //check State of availability(for SideBar)
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //統一字體Style
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  //統一裝飾(for test)
  static BoxDecoration testDecor = BoxDecoration(color: Colors.blueGrey, border: Border.all(color: Colors.lightBlue, width: 5.0,), borderRadius: BorderRadius.circular(12),);
  /*再寫一個(for 美工)*/
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;//當前登入帳戶for info
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(//to contain multiple bodys
        children: [
          SafeArea(
            child: SizedBox(
              child: GridView.count(/*it is able Scroll down if fill the Screen*/
                crossAxisCount: 2,//make it two Column
                padding: const EdgeInsets.all(30),//Edge space
                mainAxisSpacing: 30,//space between them
                crossAxisSpacing: 20,
                children: [
                  Container(
                    decoration: testDecor,
                    child: Center(
                      child: Text('test1',style: optionStyle,),
                    ),
                  ),
                  Container(
                    decoration: testDecor,
                    child: Center(
                      child: Text('test2',style: optionStyle),
                    ),
                  ),
                  Container(
                    decoration: testDecor,
                    child: Center(
                      child: Text('test3',style: optionStyle),
                    ),
                  ),
                  Container(
                    decoration: testDecor,
                    child: Center(
                      child: Text('test4',style: optionStyle),
                    ),
                  ),
                  Container(
                    decoration: testDecor,
                    child: Center(
                      child: Text('test5',style: optionStyle),
                    ),
                  ),
                  Container(
                    decoration: testDecor,
                    child: Center(
                      child: Text('test6',style: optionStyle),
                    ),
                  ),
                  Container(
                    decoration: testDecor,
                    child: Center(
                      child: Text('scorll test',style: optionStyle),
                    ),
                  ),
                  /*add more by the number of functions*/
                ],
              ),
            ),
          ),
          IconButton(//show SideBar without (TOP)AppBar
            icon: Icon(Icons.menu,color: Colors.black,),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          )
        ],
      ),
      drawer: Drawer(//SideBar
        child:  ListView(
          children: [
            DrawerHeader(/*account detail*/
                child: Container(
                  child: Row(
                    children: [
                      Text('Sign In As',
                      style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 10),
                      Text(user.email!,
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  color: Colors.blue,
                )
            ),
            Divider(thickness: 30,),//thicc
            ListTile(/*當此為範例取*/
              leading: Icon(Icons.account_circle),
              title: Text("帳戶管理"),
              onTap: (){//-->AccountPage()
                // Navigator.push(context,route);
              },
            ),
            Divider(thickness: 2,),
            ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text("客服?"),
              onTap: (){//
                // Navigator.push(context,route);
              },
            ),
            Divider(thickness: 2,),
            ListTile(
              leading: Icon(Icons.login),
              title: Text("登出帳號"),
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
            Divider(thickness: 2,),
            ListTile(
              leading: Icon(Icons.details),
              title: Text("coming soon..."),
              onTap: (){//-->
                // Navigator.push(context,route);
              },
            ),
            Divider(thickness: 2,),
            /*...add more*/
          ],
        ),
      ),
    );
  }
}
