import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_ui/widget/tabbar_widget.dart';
import 'elect.dart';
import 'page/editable_page.dart';

class VotesCnt extends StatefulWidget {
  // final Data data;
  // VotesCnt({required this.data});

  @override
  _VotesCntState createState() => _VotesCntState();
}

class _VotesCntState extends State<VotesCnt> {
  // get data => data;

  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Number of Votes',
        tabs: [
          Tab(text: ""),
          //Tab(text: 'Submit'),
          // Tab(icon: Icon(Icons.select_all), text: 'Selectable'),
        ],
        children: [
          EditablePage(),
          // Container(),
          // Container(),
        ],
      );
}
