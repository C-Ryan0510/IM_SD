import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:health/health.dart';


class Food extends StatefulWidget {
  const Food ({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  TextEditingController Timestamp = TextEditingController();

  final decro = OutlineInputBorder(borderSide: const BorderSide(color: Color.fromRGBO(45, 224, 213, 86), width: 2.0), borderRadius: BorderRadius.circular(50),);

  String DateNow = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Container(//border
        decoration: BoxDecoration(
          border: Border.all(width:2.5,color: Color.fromRGBO(45, 224, 213, 86),),
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20),),
        ),
        child: Stack(
          children: [
            //title for this record widget
            Positioned(child: Text('飲食紀錄',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),top: 10,left: 18,),
            Positioned(child: Text('紀錄時間',style: TextStyle(color: Color.fromRGBO(48, 92, 84, 100),fontSize: 16),),top: 42,left: 24,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextFormField(enabled: false,
                    // controller: Timestamp,
                    initialValue: DateNow,
                    decoration: InputDecoration(
                      enabledBorder: decro,
                      disabledBorder: decro,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.date_range_rounded,color: Colors.black,),
                      ),
                    ),
                  ),
                  TextFormField(enabled: false,
                    // controller: Timestamp,
                    initialValue: DateNow,
                    decoration: InputDecoration(
                      enabledBorder: decro,
                      disabledBorder: decro,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.timer_outlined,color: Colors.black,),
                      ),
                    ),
                  ),
                  SizedBox(height: 240,),

                  ElevatedButton(
                    child: const Text('紀錄'),
                    onPressed: () => doAll(),
                        // Navigator.pop(context),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future doAll() async{
    record();
    Navigator.pop(context);
  }
  Future record() async{
    return null;
  }
}
