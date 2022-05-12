import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/homePageModel/healthScreen.dart';
import 'package:untitled/homePageModel/mainHomeScreen.dart';
import 'package:untitled/homePageModel/recordScreen.dart';

//main()==>HomeScreen()
class HomeScreen extends StatefulWidget {
  //constructor
  const HomeScreen({Key? key}) : super(key: key);
  @override//Must override
  State<HomeScreen> createState() => _HomeStateful();
}
class _HomeStateful extends State<HomeScreen> {
  //check State of availability
  // int _selectedIndexBN = 0;
  int _selectedIndexBN = 1;//注:此數字不可存在於超出(Screens、NavigationBar)最大數-1[like index of Array]
  // int _selectedIndexBN = 2;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  @override
  void initState() {
    super.initState();
  }

  //Bodys(配合底部導覽進行轉換)
  final Screens = [ /*Normal widget or Pages()*/
    /*記錄*/
    RecordScreen(),
    /*主頁*/
    mainHome(),
    /*健康*/
    HealthScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;//當前登入帳戶for info
    return Scaffold(
      backgroundColor: Color.fromRGBO(120, 60, 40, 60),
      // backgroundColor: Colors.white,//test
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            // PageView[_selectedIndex],
            Screens[_selectedIndexBN],
            IconButton(//show SideBar without (TOP)AppBar
              alignment: Alignment.bottomRight,
              icon: Icon(Icons.menu,color: Colors.black,),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            Positioned(//other at top-right
              right: 400,
              left: 360,
                child: PopupMenuButton(
                    itemBuilder: (BuildContext bc) {
                      return const[
                        PopupMenuItem(child: Text('data')),
                      ];
                    }
                ),
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
              title: Text("帳戶管理"),
              onTap: (){//-->AccManagement()
                // Navigator.push(context,route); or // Page(),
              },
            ),
            Divider(thickness: 2,),
            ListTile(
              leading: Icon(Icons.settings_accessibility_sharp),
              title: Text("系統個人化設定"),
              onTap: (){//-->SystemValue()
              },
            ),
            Divider(thickness: 2,),
            ListTile(
              leading: Icon(Icons.phone_in_talk_sharp),
              title: Text("與客服聯繫"),
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
              title: Text("coming soon..."),
              onTap: (){},
            ),
            Divider(thickness: 2,),
            /*...add more*/
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(//底部導覽
        data: NavigationBarThemeData(
          height: 75,
          backgroundColor: Colors.transparent,
          indicatorColor: Color(0xFF23b5d3).withOpacity(0.65),//shade50~900//淺色到深色
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
              icon: Icon(Icons.book_outlined),
              selectedIcon: Icon(Icons.bookmark_add_rounded),
              label: '紀錄',
            ),
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_sharp),
              label: '主頁',
            ),
            NavigationDestination(
              icon: Icon(Icons.health_and_safety_outlined),
              selectedIcon: Icon(Icons.health_and_safety),
              label: '健康',
            ),
          ],
        ),
      ),
    );
  }
}
