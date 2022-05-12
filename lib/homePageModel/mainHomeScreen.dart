import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class mainHome extends StatefulWidget {
  const mainHome({Key? key}) : super(key: key);

  @override
  State<mainHome> createState() => _mainHomeState();
}

class _mainHomeState extends State<mainHome> {
  final _BannerController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,);
      // showMaterialModalBottomSheet<void>(
      // expand: true,
      // context: context,
      //   builder: (BuildContext context) {
      //     return Container(
      //       height: 200,
      //       color: Colors.amber,
      //       child: Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           mainAxisSize: MainAxisSize.min,
      //           children: <Widget>[
      //             const Text('Modal BottomSheet'),
      //             ElevatedButton(
      //               child: const Text('Close BottomSheet'),
      //               onPressed: () => Navigator.pop(context),
      //             )
      //           ],
      //         ),
      //       ),
      //     );
      //   },

    //   Column(
    //   mainAxisAlignment: MainAxisAlignment.end,
    //   children: <Widget>[
    //     Positioned(child: Text('Greeting',style: TextStyle(fontSize: 36),),/*greetingText()*/top: 20,),
    //     SizedBox(height: 10,),//
    //     Stack(
    //         children: [
    //           Positioned(child: Text('最新消息?',style: TextStyle(fontSize: 24),),left: 10,),
    //           Container(
    //             height: 400,
    //             width: double.infinity,
    //             decoration: BoxDecoration(
    //               // border: BorderSide(color: Colors.white,width: 10),
    //               borderRadius: BorderRadius.circular(10),
    //               color: Colors.purpleAccent.withOpacity(0.3),
    //             ),
    //             padding: EdgeInsets.only(top: 40,left: 15,right: 15),
    //             child: ListWheelScrollView(
    //               itemExtent: 200,
    //               diameterRatio: 0.1,
    //               // useMagnifier: true,
    //               magnification: 5,
    //               children: [
    //                 Container(
    //                   height: 100,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(20),
    //                     color: Colors.blue.withOpacity(0.1),
    //                   ),
    //                   child: Text('Test1',),
    //                 ),
    //                 SizedBox(height: 10,),
    //                 Stack(
    //                   children: [
    //                     Positioned(child: Text('最新消息?',style: TextStyle(fontSize: 24),),left: 10,),
    //                     Container(
    //                       height: 300,
    //                       width: double.infinity,
    //                       padding: EdgeInsets.all(20),
    //                       decoration: BoxDecoration(
    //                           color: Colors.white.withOpacity(0.2)
    //                       ),
    //                       child: PageIndicatorContainer(//import '//page_indicator.dart';
    //                         indicatorSelectorColor: Colors.black,
    //                         length: 4,//needed/*Change*/
    //                         child : PageView(//ListView滑動時會滑到物件中間&also don't have indicator
    //                           scrollDirection: Axis.horizontal,
    //                           children: [/*(text,image,[Path?/Url?])*/
    //                             _newsItems(text: 'one', imagePath: 'lib/asset/Coming_Soon.jpg'),
    //                             _newsItems(text: 'two', imagePath: 'lib/asset/Coming_Soon.jpg'),
    //                             _newsItems(text: 'three', imagePath: 'lib/asset/Coming_Soon.jpg'),
    //                             _newsItems(text: 'Coming Soon', imagePath: 'lib/asset/Coming_Soon.jpg'),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(height: 10,),
    //                 Container(
    //                   height: 100,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(20),
    //                     color: Colors.blue.withOpacity(0.3),
    //                   ),
    //                 ),
    //                 SizedBox(height: 10,),
    //                 Container(
    //                   height: 100,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(20),
    //                     color: Colors.blue.withOpacity(0.5),
    //                   ),
    //                 ),
    //                 SizedBox(height: 10,),
    //                 Container(
    //                   height: 100,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(20),
    //                     color: Colors.blue.withOpacity(0.7),
    //                   ),
    //                 ),
    //                 SizedBox(height: 10,),
    //                 Container(
    //                   height: 100,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(20),
    //                     color: Colors.blue,
    //                   ),
    //                 ),
    //                 SizedBox(height: 10,),
    //                 Container(
    //                   height: 100,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(20),
    //                     color: Colors.blue,
    //                   ),
    //                 ),
    //                 SizedBox(height: 10,),
    //                 Container(
    //                   height: 100,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(20),
    //                     color: Colors.blue,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ]
    //     ),
    //   ],
    // );
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
        color: Colors.white.withOpacity(0.3),
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
