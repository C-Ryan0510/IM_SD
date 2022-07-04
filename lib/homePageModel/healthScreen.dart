import 'package:flutter/material.dart';
class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          // Stack(
          //   children: [
          //
          //   ],
          // ),
          Container(
            child: Positioned(child: Text('Health Report',style: TextStyle(fontSize: 24),),top: 20,left: 30,),
            padding: EdgeInsets.only(top: 40,left: 15,right: 15),
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.yellowAccent.withOpacity(0.4)
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Positioned(child: Text('monitor Report',style: TextStyle(fontSize: 24),),top: 20,left: 30,),
            padding: EdgeInsets.only(top: 40,left: 15,right: 15),
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4)
            ),
          ),
          SizedBox(),
          Container(),
        ],
      ),
    );
  }
}
