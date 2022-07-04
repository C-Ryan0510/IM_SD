import 'package:flutter/material.dart';
import 'package:untitled/Pages/splash.dart';

class SSScreen extends StatefulWidget {
  const SSScreen({Key? key}) : super(key: key);

  @override
  State<SSScreen> createState() => _SSScreenState();
}

class _SSScreenState extends State<SSScreen> {

  final test = Container(
    height: 200,
    width: double.infinity,
    color: Colors.grey.shade100,
    child: Icon(Icons.add),
  );
  // final

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(45),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Splash(),
                 // (),
            )),
            child: test
          ),GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Splash(),
                 // (),
            )),
            child: test
          ),GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Splash(),
                 // (),
            )),
            child: test
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}


class _shortcut extends StatelessWidget {
  final String imageAsset;
  final String ItemData;
  // route
  _shortcut({required this.imageAsset, required this.ItemData});

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
              Image.asset('$imageAsset',),
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