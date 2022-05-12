import 'package:flutter/material.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 10,
      radius: Radius.circular(20),
      trackVisibility: true,
      showTrackOnHover: true,
      child: Padding(
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

