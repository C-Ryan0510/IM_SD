import 'package:flutter/material.dart';

import '../popup_records/eatFood.dart';
import '../popup_records/body_Temperature.dart';
import '../popup_records/eatDrug.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.all(45),
        child: Scrollbar(
        thickness: 5,
        radius: Radius.circular(20),
        trackVisibility: true,
        showTrackOnHover: true,
        child: Container(
          height: 1200,
          width: double.infinity,
          // color: Colors.black.withOpacity(0.2),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Scrollbar(
              thickness: 5,
              radius: Radius.circular(20),
              trackVisibility: true,
              showTrackOnHover: true,
              child: GridView(
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,//3格寬太小
                  mainAxisSpacing: 32,crossAxisSpacing: 20,
                ),
                children: [/*(image,text,[route?])*/
                  //View menuItem() @ bottom of this file
                  _menuItem(imagePath: 'lib/asset/eat_record(2).png', ItemData: '飲食',PopupRecord: 'Food',),
                  _menuItem(imagePath: 'lib/asset/drug_record.png', ItemData: '用藥',PopupRecord: 'Drug',),
                  _menuItem(imagePath: 'lib/asset/temperature_record.png', ItemData: '體溫',PopupRecord: 'Temperature',),
                  _menuItem(imagePath: 'lib/asset/water_record.png', ItemData: '飲水量',PopupRecord: 'Water',),
                  _menuItem(imagePath: 'lib/asset/bloodsugar_record.png', ItemData: '血糖、胰島素',PopupRecord: 'Sugar',),
                  _menuItem(imagePath: 'lib/asset/pulse_record.png', ItemData: '血壓、心率',PopupRecord: 'Pulse',),
                  _menuItem(imagePath: 'lib/asset/exercise_record.png', ItemData: '運動量',PopupRecord: 'Exercise',),
                  _menuItem(imagePath: 'lib/asset/sleeping_record.png', ItemData: '睡眠時間 ',PopupRecord: 'Sleep',),
                ],
              ),
            ),
          ),
        ),
        ),
    );
  }
}

//記錄方式
class _menuItem extends StatelessWidget {
  final String imagePath; 
  final String ItemData;
  final String PopupRecord;
  // route
  _menuItem({required this.imagePath, required this.ItemData, required this.PopupRecord});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: OutlinedButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('$imagePath',),
              Text('$ItemData',
                style: TextStyle(
                  backgroundColor: Colors.transparent,
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            // side: BorderSide(width: 5,color: Colors.grey),
          ),
          onPressed: () => {
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              ),
              builder: (BuildContext context) {
                switch(this.PopupRecord){
                  case 'Food':
                    return Food();
                  case 'Drug':
                    return Drug();
                  case 'Temperature':
                    return Temperature();
                  // case 'Water':
                  //   return Water();
                  // case 'Sugar':
                  //   return Suagr();
                  // case 'Pulse':
                  //   return Pulse();
                  // case 'Exercise':
                  //   return Exercise();
                  // case 'Sleep':
                  //   return Sleep();
                  default:
                    return Container(child: Center(child:Text('an ERROR occurred\nPlease try agian later.'),),);
                }
              },
            ),
          }
        ),
      ),
    );
  }
}

