import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

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
  final _BannerController = PageController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  //Bodys(配合底部導覽進行轉換)
  final Screens = [ /*Normal widget or Pages()*/
    // ForgotPage(),// test
    /*記錄*/
    Padding(
      padding: EdgeInsets.all(45),
      child: GridView(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,//3格寬太小
          mainAxisSpacing: 20,crossAxisSpacing: 20,
        ),
        children: [/*(image,text,[route?])*/
          //View menuItem() @ bottom of this file
          _menuItem(imagePath: 'lib/asset/health_Pills.jpg', ItemData: '藥品',),
          _menuItem(imagePath: 'lib/asset/diet_period.jpg', ItemData: '每日飲食',),
          _menuItem(imagePath: 'lib/asset/health_Heart_pulse.jpg', ItemData: '生命跡象',),
          _menuItem(imagePath: 'lib/asset/diet_water.jpg', ItemData: '水分攝取',),
          _menuItem(imagePath: 'lib/asset/health_special.jpg', ItemData: '!?!?!?!',),
          _menuItem(imagePath: 'lib/asset/diet_daily.jpg', ItemData: '?????',),
          _menuItem(imagePath: 'lib/asset/diet_calories.jpg', ItemData: '熱量',),
          _menuItem(imagePath: 'lib/asset/diet_special.jpg', ItemData: '健康養分',),
          _menuItem(imagePath: 'lib/asset/healthcare.png', ItemData: 'Coming Soon!',),
          /*add more by the number of functions*/
        ],
      ),
    ),
    /*主頁*/
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Stack(
          children: [
            Positioned(child: Text('最新消息',style: TextStyle(fontSize: 24),)),
            Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2)
              ),
              child: PageIndicatorContainer(//import '//page_indicator.dart';
                indicatorSelectorColor: Colors.blueGrey,
                length: 4,//needed/*Change*/
                child : PageView(//ListView滑動時會滑到物件中間&also don't have indicator
                  scrollDirection: Axis.horizontal,
                  children: [/*(text,image,[Path?/Url?])*/
                    _newsItems(text: 'one', imagePath: 'lib/asset/Coming_Soon.jpg'),
                    _newsItems(text: 'two', imagePath: 'lib/asset/Coming_Soon.jpg'),
                    _newsItems(text: 'three', imagePath: 'lib/asset/Coming_Soon.jpg'),
                    _newsItems(text: 'Coming Soon', imagePath: 'lib/asset/Coming_Soon.jpg'),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5,),//
        Stack(
          children: [
            Positioned(child: Text('最新消息',style: TextStyle(fontSize: 24),)),
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                // border: BorderSide(color: Colors.white,width: 10),
                borderRadius: BorderRadius.circular(10),
                color: Colors.purpleAccent.withOpacity(0.3),
              ),
              padding: EdgeInsets.only(top: 40,left: 15,right: 15),
              child: ListView(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ],
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
                  color: Colors.white,
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

class _newsItems extends StatelessWidget{
  final String text;
  final String imagePath;
  // final String url;
  _newsItems({required this.text, required this.imagePath, /*required this.url*/});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
      ),
      padding: EdgeInsets.all(15),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(child: Image.asset('$imagePath',fit: BoxFit.contain,),),
          Positioned(child: Text('$text',style: TextStyle(fontSize: 24),),bottom: 5,left: 10,),
        ],
      ),
    );
  }
}

//記錄方式
class _menuItem extends StatelessWidget {
  final String imagePath;
  final String ItemData;
  // route
  _menuItem({required this.imagePath, required this.ItemData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.transparent,
        color: Colors.white,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            // side: BorderSide(width: 5,color: Colors.grey),
          ),
          onPressed: () {},//navigator-->otherPage
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('$imagePath',),
              Text(
                '$ItemData',
                style: TextStyle(
                    backgroundColor: Colors.white,
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
