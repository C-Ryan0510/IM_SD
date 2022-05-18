import 'package:flutter/material.dart';

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
  final _BannerController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child:Text(greeting(),style: TextStyle(fontSize: 50),),),
        Container(color: Colors.white.withOpacity(0.5),),
        SizedBox.expand(/*news*/
          child: DraggableScrollableSheet(
            initialChildSize: 0.8,
            maxChildSize: 0.93,
            minChildSize: 0.055,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),),
                ),
                child: Stack(
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.only(top:25,left: 10,right: 10),
                      controller: scrollController,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            child: Text('$index'+'News'),
                            padding: EdgeInsets.all(10),
                            height: 100,
                            decoration:BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
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
