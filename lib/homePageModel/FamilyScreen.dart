import 'package:flutter/material.dart';

class FGroupScreen extends StatefulWidget {
  const FGroupScreen({Key? key}) : super(key: key);

  @override
  State<FGroupScreen> createState() => _FGroupScreenState();
}

class _FGroupScreenState extends State<FGroupScreen> {

  final test = Container(height: double.infinity,width: double.infinity,color: Colors.lightBlueAccent,child: Text('Family'),);

  final PersonDecro = BoxDecoration(color: Colors.blueGrey.shade200);
  // final Demo = ;

  final pressed = SnackBar(content: const Text('you Pressed that button'));
  final hold = SnackBar(content: const Text('you hold the button'));

  //??No family
  final _DefaultScreen = Container(height: 1000,width: double.infinity,color:Colors.grey.shade100,
    child: Align(alignment: Alignment.center,
      child: Text('你還沒有家人',style: TextStyle(fontSize: 30),),
    ),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :Padding(
        padding: EdgeInsets.only(top: 50),
        child:
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            children: [
              ListTile(tileColor: Colors.white,textColor: Color.fromRGBO(48, 92, 84, 100),focusColor: Colors.grey,hoverColor: Colors.blue,
                leading: CircleAvatar(child: Icon(Icons.self_improvement),),
                title: Text('your friend'),
                subtitle: Text('home'),
                trailing: Icon(Icons.close),
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(pressed).close,
                onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(hold).close,
              ),
              Divider(thickness: 2,),
              ListTile(tileColor: Colors.white,textColor: Color.fromRGBO(48, 92, 84, 100),focusColor: Colors.grey,hoverColor: Colors.blue,
                leading: CircleAvatar(child: Icon(Icons.self_improvement),),
                title: Text('title'),
                subtitle: Text('subtitle'),
                trailing: Text('trailing'),
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(pressed).close,
                onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(hold).close,
              ),
              Divider(thickness: 2,),
              ListTile(tileColor: Colors.white,textColor: Color.fromRGBO(48, 92, 84, 100),focusColor: Colors.grey,hoverColor: Colors.blue,
                leading: CircleAvatar(child: Icon(Icons.self_improvement),),
                title: Text('title'),
                subtitle: Text('subtitle'),
                trailing: Text('trailing'),
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(pressed).close,
                onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(hold).close,
              ),
            ],
          ),
          // test,
        ),

        // _DefaultScreen,//Detect family members = 0
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(pressed),
        // _addMember,
        backgroundColor: Color.fromRGBO(45, 224, 213, 86),
        child: const Icon(Icons.add,),
      ),
    );
  }
}
