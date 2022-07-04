import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class mainHome extends StatefulWidget {
  const mainHome({Key? key}) : super(key: key);

  @override
  State<mainHome> createState() => _mainHomeState();
}

class _mainHomeState extends State<mainHome> {

  greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return '早上好!';
    }
    if (hour < 17) {
      return '安逸午後';
    }
    return '晚上好';
  }

  final MonitorsC = PageController(initialPage: 0,);
  final NEWSC = PageController(initialPage: 0,);

  final SignalOut = Center(child: Text('No Signal',style: TextStyle(fontSize: 24),),);
  final LoadFail = Center(child: Text('無法載入',style: TextStyle(fontSize: 24),),);
  final AddDevice = Column(//==>add Device Page
    children: [
      SizedBox(height: 50,),
      Center(child: IconButton(icon: Icon(Icons.add_circle_outlined,size: 24,color: Colors.blueGrey,), onPressed: () => null,),),
      Center(child: Text('新增裝置'),),
    ],
  );

  final homeDecoration = BoxDecoration(border: Border.all(color: Color.fromRGBO(45, 224, 213, 86)),borderRadius: BorderRadius.circular(24),);
  final familyCard = Card(child: SizedBox(
    width: 89,
    height: 100,
    child: Center(child: Text('Family Member')),
  ),);
  final JustcardDesign = Card(child: SizedBox(
    width: 89,height: 100,
    child: Stack(
      children: [
        Align(alignment: Alignment.topCenter,child: CircleAvatar(child: Icon(Icons.self_improvement),),),
        Align(alignment: Alignment.center,child: Center(child: Text('state\nonline'),),),
      ],
    ),
  ),);

  @override
  void initState() {
    super.initState();
  }

  final testCondition = true;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 70,left: 50,right: 50,),
      child: Column(
        children: [
          Align(alignment:Alignment.centerLeft,child: Text('最新消息',style: TextStyle(color: Color.fromRGBO(48, 92, 84, 100)),),),
          Container(height: 200,width:double.infinity,
            // color: Colors.grey,
            decoration: homeDecoration,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  // TabPageSelector(),
                  PageView(
                    controller: NEWSC,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(color: Colors.grey.withOpacity(0.2),child: (testCondition)? (testCondition)? SignalOut:LoadFail:AddDevice,),
                      Container(color: Colors.grey.withOpacity(0.2),child: (testCondition)? (false)? SignalOut:LoadFail:AddDevice,),
                      Container(color: Colors.grey.withOpacity(0.2),child: (false)? (testCondition)? SignalOut:LoadFail:AddDevice,),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SmoothPageIndicator(
                      controller: NEWSC,
                      count: 3,//Monitor count
                      effect: ExpandingDotsEffect(),
                      // WormEffect(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          Align(alignment:Alignment.centerLeft,child: Text('快訊',style: TextStyle(color: Color.fromRGBO(48, 92, 84, 100)),),),
          Container(height: 400,width:double.infinity,
            // color: Colors.grey.withOpacity(0.3),
            decoration: homeDecoration,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(height:150,width: double.infinity,
                  // color: Colors.amber.withOpacity(0.2),
                  child: ListView(scrollDirection: Axis.horizontal,
                    children: [
                      JustcardDesign,
                      familyCard,
                      JustcardDesign,
                      familyCard,
                      familyCard,
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(height:205,width: double.infinity,
                  // color: Colors.amber,
                  child:
                  Stack(
                    children: [
                      // TabPageSelector(),
                      PageView(
                        controller: MonitorsC,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(color: Colors.grey.withOpacity(0.2),child: SignalOut,),
                          Container(color: Colors.grey.withOpacity(0.2),child: LoadFail,),
                          Container(color: Colors.grey.withOpacity(0.2),child: AddDevice,),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SmoothPageIndicator(
                          controller: MonitorsC,
                          count: 3,//Monitor count
                          effect: ExpandingDotsEffect(),
                          // WormEffect(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //   Stack(
    //   children: [
    //     Center(child:Text(greeting(),style: TextStyle(fontSize: 50),),),
    //     Container(color: Colors.white.withOpacity(0.5),),
    //     SizedBox.expand(/*news*/
    //       child: DraggableScrollableSheet(
    //         initialChildSize: 0.8,
    //         maxChildSize: 0.93,
    //         minChildSize: 0.055,
    //         builder: (BuildContext context, ScrollController scrollController) {
    //           return Container(
    //             padding: EdgeInsets.all(15),
    //             decoration: BoxDecoration(
    //               color: Colors.greenAccent,
    //               borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),),
    //             ),
    //             child: Stack(
    //               children: [
    //                 ListView.builder(
    //                   padding: EdgeInsets.only(top:25,left: 10,right: 10),
    //                   controller: scrollController,
    //                   itemCount: 10,
    //                   itemBuilder: (BuildContext context, int index) {
    //                     return Padding(
    //                       padding: EdgeInsets.all(5),
    //                       child: Container(
    //                         child: Text('$index'+'News'),
    //                         padding: EdgeInsets.all(10),
    //                         height: 100,
    //                         decoration:BoxDecoration(
    //                             color: Colors.blue[100],
    //                             borderRadius: BorderRadius.circular(10)
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                 ),
    //               ],
    //             ),
    //           );
    //         },
    //       ),
    //     )
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
