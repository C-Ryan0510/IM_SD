import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/candidates.dart';
import 'package:login_ui/incident.dart';
import 'package:login_ui/votes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_ui/api.dart';
import 'model/precint.dart';

class ElectRtn extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _ElectRtnState createState() => _ElectRtnState();
}

class _ElectRtnState extends State<ElectRtn> {
  String? elpos;
  String? authtoken;
  final _storage = FlutterSecureStorage();
  String region = "";
  String province = "";
  String code = "";
  String no = "";
  String municipality = "";
  String place = "";
  dynamic regvotes = "";
  String barangay = "";
  String error = "";

  final _formKey = GlobalKey<FormState>();

  bool _show = false;

  final precintController = TextEditingController();

  Future getData(value) async {
    var rsp = await fetchPrecint(value);

    if (rsp['data'] != null) {
      var data = new Map<String, dynamic>.from(rsp['data']);
      setState(() {
        _show = true;
        error = '';
        region = data['region'];
        code = data['precint_code'];
        province = data['province'];
        no = data['precint_no'];
        municipality = data['municipality'];
        place = data['pollplace'];
        regvotes = data['regvoters'];
        barangay = data['barangay'];
      });
    } else {
      setState(() {
        _show = false;
        error = rsp['message'];
        region = '';
        code = '';
        province = '';
        no = '';
        municipality = '';
        place = '';
        regvotes = '';
        barangay = '';
      });
    }
  }

  List<Precint> precintDetails = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Votes Registry'),
      ),
      body: Center(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(0.0),
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 40),
                      child: TextFormField(
                        validator: (String? val) =>
                            val!.isEmpty ? 'Please enter password' : null,
                        decoration: InputDecoration(labelText: "Precint"),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textInputAction: TextInputAction.search,
                        controller: precintController,
                        onFieldSubmitted: (value) async {
                          if (_formKey.currentState!.validate()) {
                            await getData(precintController.text);
                          }
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await getData(precintController.text);
                      }
                    },
                    icon: const Icon(Icons.search),
                  )
                ],
              ),
            ),
            Center(
              child: Text(
                error,
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 7, 7), fontSize: 14.0),
              ),
            ),
            Center(
              child: Text(
                "Precint Code: " + code,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0),
              ),
            ),
            Center(
              child: Text(
                "Region: " + region,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0),
              ),
            ),
            Center(
              child: Text(
                "Municipality: " + municipality,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0),
              ),
            ),
            Center(
              child: Text(
                "Province: " + province,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0),
              ),
            ),
            Center(
              child: Text(
                "Barangay: " + barangay,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0),
              ),
            ),
            Center(
              child: Text(
                "Precint No: " + no,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0),
              ),
            ),
            Center(
              child: Text(
                "Poll Place: " + place,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0),
              ),
            ),
            Center(
              child: Text(
                "Registered Voters: $regvotes",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0),
              ),
            ),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: _show,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)),
                  padding: const EdgeInsets.all(0),
                ),
                onPressed: () async {
                  //final data = Data(text: "$_chosenValue");

                  var pcode = code;
                  await _storage.write(key: "pcode", value: pcode);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VotesCnt()));
                },
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => IncedentReport()))
                },
                child: Text(
                  "Submit an Incident Report?",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Data {
  String text;
  Data({required this.text});
}
