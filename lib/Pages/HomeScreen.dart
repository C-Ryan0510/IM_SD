import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:untitled/Pages/accountManagement.dart';
import 'package:untitled/homePageModel/Data_Analysis_Screen.dart';
import 'package:untitled/homePageModel/Secure_and_Safety_Screen.dart';
import 'package:untitled/homePageModel/healthScreen.dart';
import 'package:untitled/homePageModel/mainHomeScreen.dart';
import 'package:untitled/homePageModel/recordScreen.dart';
import 'package:untitled/homePageModel/FamilyScreen.dart';

//main()==>HomeScreen()
class HomeScreen extends StatefulWidget {
  //constructor
  const HomeScreen({Key? key}) : super(key: key);
  @override//Must override
  State<HomeScreen> createState() => _HomeStateful();
}
class _HomeStateful extends State<HomeScreen> {
  //check State of availability
  int _selectedIndexBN = 0;//注:此數字不可存在於超出(Screens、NavigationBar)最大數-1[like index of Array]

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  //Bodys(配合底部導覽進行轉換)
  final Screens = [ /*Normal widget or Pages()*/
    /*主頁*/
    mainHome(),
    /*家庭*/
    FGroupScreen(),
    /*記錄*/
    RecordScreen(),
    /*數據*/
    AnalysisScreen(),
    /*安全*/
    SSScreen(),

    // HealthScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;//當前登入帳戶for info
    return Scaffold(
      // backgroundColor: Color.fromRGBO(120, 60, 40, 60),
      // backgroundColor: Colors.white,//test
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Screens[_selectedIndexBN],
            Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),//ceiling
              child: IconButton(//show SideBar without (TOP)AppBar
                alignment: Alignment.bottomRight,
                icon: Icon(Icons.menu,color: Colors.black,size: 37,),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20),//Not touch ceiling
              child: Align( alignment: Alignment.topCenter,
                child: Text('Home secure',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromRGBO(45, 224, 213, 86)),),),
            ),
          ],
        ),
      ),
      drawer: Drawer(//SideBar
        child:  ListView(
          children: [
            DrawerHeader(/*account detail (Click able???)*/
                decoration: BoxDecoration(//Only PageWidget(Container)背景
                  gradient: LinearGradient(//漸層色
                    colors: [
                      Colors.orange,//begin
                      Colors.deepOrangeAccent,
                      Colors.redAccent,
                      Colors.blueAccent.shade400,
                      Colors.lightBlueAccent, //end
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  color: Colors.white.withOpacity(0.7),
                  child: Column(
                    children: [
                      Text('Sign In As', style: TextStyle(fontSize: 20),),
                      SizedBox(width: 10),
                      Text(user.email!, style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
            ),
            Divider(thickness: 30,),//thicc
            ListTile(/*當此為範例Ctrl+C&Ctrl+V*/
              leading: Icon(Icons.account_circle),
              title: Text("個人和帳戶管理"),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ManageAccount(),//to Forgot()
              )),
            ),
            Divider(thickness: 2,),
            ListTile(
              leading: Icon(Icons.settings_accessibility_sharp),
              title: Text("系統設定"),
              onTap: (){//-->SystemValue()
              },
            ),
            Divider(thickness: 2,),
            ListTile(
              leading: Icon(Icons.phone_in_talk_sharp),
              title: Text("與服務者聯繫"),
              onTap: (){/*Function*/},
            ),
            Divider(thickness: 2,),
            ListTile(
              leading: Icon(Icons.login),
              title: Text("登出帳號"),//登出-->MainScreen() ==> return loginPage(),
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
            Divider(thickness: 2,),
            ListTile(
              leading: Icon(Icons.details),
              title: Text("聯絡我們"),
              onTap: (){},
            ),
            Divider(thickness: 2,),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(//底部導覽
        data: NavigationBarThemeData(
          height: 75,
          backgroundColor: Colors.transparent,
          indicatorColor: Color.fromRGBO(45, 224, 213, 90),//shade50~900//淺色到深色
          // iconTheme: MaterialStateProperty.all(Icon),
          labelTextStyle: MaterialStateProperty.all(TextStyle(fontSize: 25),),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndexBN,
          onDestinationSelected: (_selectedIndex)//onTap change index
          => setState(() => this._selectedIndexBN = _selectedIndex),
          /*點擊選取(0.5秒)*/
          animationDuration: Duration(milliseconds: 500),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_sharp),
              label: '首頁',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border_sharp),
              selectedIcon: Icon(Icons.favorite_sharp),
              label: '家庭',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_box_outlined),
              selectedIcon: Icon(Icons.add_box_sharp),
              label: '紀錄',
            ),
            NavigationDestination(
              icon: Icon(Icons.analytics_outlined),
              selectedIcon: Icon(Icons.analytics_rounded),
              label: '數據',
            ),
            NavigationDestination(
              icon: Icon(Icons.shield_outlined),
              selectedIcon: Icon(Icons.shield_sharp),
              label: '安全',
            ),
          ],
        ),
      ),
    );
  }
}
