import 'package:firebase_auth/firebase_auth.dart';
import 'ForgotPasswordPage.dart';
import 'package:flutter/material.dart';

//main()==>HomeScreen()
class HomeScreen extends StatefulWidget {
  //constructor
  const HomeScreen({Key? key}) : super(key: key);
  @override//Must override
  State<HomeScreen> createState() => _HomeStateful();
}
class _HomeStateful extends State<HomeScreen> {
  //check State of availability
  int _selectedIndex = 1;//注:此數字不可存在於超出(Screens、NavigationBar)最大數-1[like index of Array]
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //統一字體美工(for now)
  static const TextStyle optionStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static BoxDecoration testDecor = BoxDecoration(color: Colors.black12/*, border: Border.all(color: Colors.purple, width: 1.0,)*/,);

  //Bodys(配合底部導覽進行轉換)
  final Screens = [ /*Normal widget or Pages()*/
    // ForgotPage(),// test
    /*記錄*/
    Center(
      child: SafeArea(
        child: SizedBox(
          child: GridView.count(/*it is able Scroll down if fill the Screen*/
            crossAxisCount: 3,//make it two Column
            padding: const EdgeInsets.all(30),//Edge space
            mainAxisSpacing: 70,//space between them
            crossAxisSpacing: 20,
            children: [
              Container(
                child: Column(
                  children: [
                    Image.asset('lib/asset/healthcare.png',fit: BoxFit.fill,),
                    SizedBox(height: 5,),
                    Text('最新通知',style: optionStyle,),
                  ],
                ),
              ),
              Container(
                decoration: testDecor,
                child: Center(
                  child: Text('最新通知',style: optionStyle,),
                ),
              ),
              Container(
                decoration: testDecor,
                child: Center(
                  child: Text('健康諮詢',style: optionStyle),
                ),
              ),
              Container(
                decoration: testDecor,
                child: Center(
                  child: Text('聊天',style: optionStyle),
                ),
              ),
              Container(
                decoration: testDecor,
                child: Center(
                  child: Text('風險預防',style: optionStyle),
                ),
              ),
              Container(
                decoration: testDecor,
                child: Center(
                  child: Text('我的報告',style: optionStyle),
                ),
              ),
              Container(
                decoration: testDecor,
                child: Center(
                  child: Text('相關設備',style: optionStyle),
                ),
              ),
              Container(
                decoration: testDecor,
                child: const Center(
                  child: Text('Coming Soon!',style: optionStyle,textAlign: TextAlign.center,),
                ),
              ),
              /*add more by the number of functions*/
            ],
          ),
        ),
      ),
    ),
    /*主頁*/
    Column(
      children: [
        Positioned(height: 100,child: Text('健康報告',style: TextStyle(fontSize: 30),),),
        Positioned(child: Text('最新消息',style: TextStyle(fontSize: 30),),),
      ],
    ),
    /*健康*/
    Center(child: Text('HEALTH I don\'t care!!',style: TextStyle(fontSize: 30),),),
  ];

  /*再寫一個(for 美工)*/
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;//當前登入帳戶for info
    return Scaffold(
      backgroundColor: Colors.amber,
      key: _scaffoldKey,
      body: Stack(
        children: [
          Screens[_selectedIndex],
          IconButton(//show SideBar without (TOP)AppBar
            icon: Icon(Icons.menu,color: Colors.black,),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ],
      ),
      drawer: Drawer(//SideBar
        child:  ListView(
          children: [
            DrawerHeader(/*account detail (Click able???)*/
                child: Container(
                  child: Column(
                    children: [
                      Text('Sign In As', style: TextStyle(fontSize: 20),),
                      SizedBox(width: 10),
                      Text(user.email!, style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  color: Colors.blue,
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

      /*origin*/
      bottomNavigationBar: NavigationBarTheme(//底部導覽
        data: NavigationBarThemeData(
          height: 75,
          backgroundColor: Colors.transparent,
          indicatorColor: Color.fromRGBO(35,181,211,100),//shade50~900//淺色到深色
          // iconTheme: MaterialStateProperty.all(Icon),
          labelTextStyle: MaterialStateProperty.all(TextStyle(fontSize: 25),),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (_selectedIndex)//onTap change index
          => setState(() => this._selectedIndex = _selectedIndex),
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
