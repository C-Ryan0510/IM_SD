import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {


  final pressed = SnackBar(content: const Text('you Pressed that button'));
  final hold = SnackBar(content: const Text('you hold the button'));

  final _DefaultScreen = Container(height: 300,width: double.infinity,color:Colors.grey.shade100,
    child: Align(alignment: Alignment.center,
      child: Text('你還沒有紀錄你的生活',style: TextStyle(fontSize: 30),),
    ),
  );

  final _recordedData = Container(height: 300,width: double.infinity,color:Colors.grey.shade100,
    child: Align(alignment: Alignment.center,
      child: Row(
        // children: [
        //
        // ],
      ),
    ),
  );

  CalendarFormat format = CalendarFormat.twoWeeks;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  final _DefaultCalendar = TableCalendar(
    firstDay: DateTime(1950),
    lastDay: DateTime(2050),
    focusedDay: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime(1950),
              lastDay: DateTime(2050),
              focusedDay: DateTime.now(),

              //Calendar Sizes' [2weeks, a week,mouth(4weeks)]
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {//set Calendar to next size(show on button)
                  format = _format;
                });
              },
              //onPress
              selectedDayPredicate: (DateTime date){//Date Select action
                return isSameDay(selectedDay, date);
              },
              onDaySelected: (DateTime selectDay,DateTime focusDay) {
                setState(() {//Date select States
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);//print on console
              },

              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,
              //Style
              calendarStyle: CalendarStyle(isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Color.fromRGBO(45, 224, 213, 100),
                    shape: BoxShape.circle,
                  ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle
                ),
              ),
              headerStyle: HeaderStyle(
                // formatButtonVisible: false,// default is true
                formatButtonShowsNext: false,// false = current Size
                formatButtonDecoration: BoxDecoration(
                  color: Color.fromRGBO(45, 224, 213, 100),
                  borderRadius: BorderRadius.circular(5),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.black,
                ),
                // leftChevronVisible: false,//cancel <--
                // rightChevronVisible: false,//cancel -->
              ),
            ),
            SizedBox(height: 10,),
            // _DefaultScreen,
            Container(height: 250,width: double.infinity,
              color:Colors.grey.shade100,
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _AnalysisOutcome(),
                    SizedBox(width: 10,),
                    _AnalysisOutcome(),
                    SizedBox(width: 10,),
                    _AnalysisOutcome(),
                    SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ScaffoldMessenger.of(context).showSnackBar(pressed),
        // _add???
        backgroundColor: Color.fromRGBO(45, 224, 213, 86),
        child: const Icon(Icons.add,),
      ),
    );
  }
}


class _AnalysisOutcome extends StatelessWidget {
  // final String imagePath;
  // final String ItemData;

  // _AnalysisOutcome({required this.imagePath, required this.ItemData});
  _AnalysisOutcome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(height: double.infinity,width:150,color: Colors.grey,);
    // Center(
    //   child: Container(
    //     // color: Colors.transparent,
    //     color: Colors.white,
    //     child: OutlinedButton(
    //       style: OutlinedButton.styleFrom(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //         // side: BorderSide(width: 5,color: Colors.grey),
    //       ),
    //       onPressed: () {},//navigator-->otherPage
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Image.asset('$imagePath',),
    //           Text(
    //             '$ItemData',
    //             style: TextStyle(
    //                 backgroundColor: Colors.transparent,
    //                 color: Colors.black,
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.bold
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
