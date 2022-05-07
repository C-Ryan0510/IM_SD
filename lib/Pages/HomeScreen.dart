import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
  // int _selectedIndex = 0;
  int _selectedIndex = 1;//注:此數字不可存在於超出(Screens、NavigationBar)最大數-1[like index of Array]
  // int _selectedIndex = 2;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  //Bodys(配合底部導覽進行轉換)
  final Screens = [ /*Normal widget or Pages()*/
    // ForgotPage(),// test
    /*記錄*/
    Container(
      child: Padding(
        padding: EdgeInsets.all(30),//20 for crossAxisCount=3//30 for crossAxisCount=2
        child: GridView(//View menuItem() @ bottom of this file
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,//3格寬太小
            mainAxisSpacing: 20,crossAxisSpacing: 20,
          ),
          children: [
            menuItem(imagePath: 'lib/asset/health_Pills.jpg', ItemData: '藥品',),
            menuItem(imagePath: 'lib/asset/diet_period.jpg', ItemData: '每日飲食',),
            menuItem(imagePath: 'lib/asset/health_Heart_pulse.jpg', ItemData: '生命跡象',),
            menuItem(imagePath: 'lib/asset/diet_water.jpg', ItemData: '水分攝取',),
            menuItem(imagePath: 'lib/asset/health_special.jpg', ItemData: '!?!?!?!',),
            menuItem(imagePath: 'lib/asset/diet_daily.jpg', ItemData: '?????',),
            menuItem(imagePath: 'lib/asset/diet_calories.jpg', ItemData: '熱量',),
            menuItem(imagePath: 'lib/asset/diet_special.jpg', ItemData: '健康養分',),
            menuItem(imagePath: 'lib/asset/healthcare.png', ItemData: 'Coming Soon!',),
            /*add more by the number of functions*/
          ],
        ),
      ),
    ),
    /*主頁*/
    Container(
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(//PageWidget(Container)背景
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
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text('最新消息',style: TextStyle(fontSize: 30),),
              // child: Positioned(height: 100,child: Text('健康報告',style: TextStyle(fontSize: 30),),),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight, end: Alignment.bottomLeft,
                  colors: [Colors.white24,Colors.white60],//glass?
                ),
              ),
            ),
            SizedBox(height: 100,),
            Container(
              padding: EdgeInsets.all(10),
              // child: Positioned(child: Text('最新消息',style: TextStyle(fontSize: 30),),),
              child: Text('健康報告',style: TextStyle(fontSize: 30),),
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent.withOpacity(0.4)//Always <=1
              ),
            ),
          ],
        ),
      )
    ),

    /*健康*/
    Center(child: Text('HEALTH I don\'t care!!',style: TextStyle(fontSize: 30),),),
  ];


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;//當前登入帳戶for info
    return Scaffold(
      backgroundColor: Color.fromRGBO(120, 60, 40, 60),
      key: _scaffoldKey,
      body: Stack(
        children: [
          Screens[_selectedIndex],
          IconButton(//show SideBar without (TOP)AppBar
            alignment: Alignment.bottomRight,
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

      bottomNavigationBar: NavigationBarTheme(//底部導覽
        data: NavigationBarThemeData(
          height: 75,
          backgroundColor: Colors.transparent,
          indicatorColor: Color(0xFF23b5d3).withOpacity(0.65),//shade50~900//淺色到深色
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



//記錄方式
class menuItem extends StatelessWidget {
  final String imagePath;
  final String ItemData;
  // route
  menuItem({required this.imagePath, required this.ItemData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.transparent,
        color: Colors.white,
        child: OutlinedButton(
          onPressed: () {},//navigator-->otherPage
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('$imagePath'),
              Text(
                '$ItemData',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
