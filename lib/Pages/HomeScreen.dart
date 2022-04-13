import 'package:flutter/material.dart';

//main()==>HomeScreen()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomeStateful(),
    );
  }
}

//網址： https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
//custom StatefulWidget class
class HomeStateful extends StatefulWidget {
  //constructor
  const HomeStateful({Key? key}) : super(key: key);

  @override//Must override
  State<HomeStateful> createState() => _MyStatefulWidgetState();
}
//custom NavigationBar widget
class _MyStatefulWidgetState extends State<HomeStateful> {
  int _selectedIndex = 0;
  //統一字體Style
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  //點擊動作
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  //List of Widgets for Navigation Bars
  static const List<Widget> _widgetOptions = <Widget>[
    /*改這裡... Text() OR go to other pages*/
    Text('0: 首頁',
      style: optionStyle,
    ),
    Text('1: 分析',
      style: optionStyle,
    ),
    Text('2: 設定',
      style: optionStyle,
    ),
    /*看要不要再多*/
    // Text('3: ',
    //   style: optionStyle,
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(//create list
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首頁',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '分析',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
          /*這裡也要改*/
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
