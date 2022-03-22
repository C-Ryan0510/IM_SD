import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VotesIn extends StatefulWidget {
  @override
  _VotesInState createState() => _VotesInState();
}

class _VotesInState extends State<VotesIn> {
  List<Map> _votes = [
    {'name': 'Juan Santos', 'nbvotes': 0},
    {'name': 'Pedro Reyes', 'nbvotes': 0},
    {'name': 'Jose Madrigal', 'nbvotes': 0},
  ];
  bool? _isEditMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number of Votes'),
      ),
      body: ListView(
        children: [_createDataTable(), _createCheckboxField(), _SaveData()],
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Candidate')),
      DataColumn(label: Text('# Votes'))
    ];
  }

  List<DataRow> _createRows() {
    return _votes
        .map((votes) => DataRow(cells: [
              DataCell(Text(
                votes['name'],
                style: TextStyle(fontSize: 16),
              )),
              _createTitleCell(votes['nbvotes'].toString())
            ]))
        .toList();
  }

  DataCell _createTitleCell(voteTitle) {
    return DataCell(_isEditMode == true
        ? TextFormField(initialValue: voteTitle, style: TextStyle(fontSize: 16))
        : Text(voteTitle));
  }

  Row _createCheckboxField() {
    return Row(
      children: [
        Checkbox(
          value: _isEditMode,
          onChanged: (value) {
            setState(() {
              _isEditMode = value;
            });
          },
        ),
        Text('Edit mode'),
      ],
    );
  }
}

Row _SaveData() {
  return Row(
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () {
        },
        child: Text(
          "Save",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      )
    ],
  );
}
