import 'package:flutter/material.dart';
class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(child: Text('Report',style: TextStyle(fontSize: 24),),top: 40,left: 20,),
            Container(
              padding: EdgeInsets.only(top: 40,left: 15,right: 15),
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4)
              ),
            ),
            SizedBox(),
            Container(),
            SizedBox(),
            Container(),
          ],
        ),
      ],
    );
  }
}
