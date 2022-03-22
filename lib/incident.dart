import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'api.dart';
import 'dart:math';

class IncedentReport extends StatefulWidget {
  IncedentReport({Key? key}) : super(key: key);

  @override
  State<IncedentReport> createState() => _IncedentReportState();
}

class _IncedentReportState extends State<IncedentReport> {
  //DECLARATIONS AND ASSIGNMENTS
  bool _show = true;
  final _controller = TextEditingController();
  String? _chosenValue0;
  final precintController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String region = "";
  String province = "";
  String code = "";
  String no = "";
  String municipality = "";
  String place = "";
  dynamic regvotes = "";
  String barangay = "";
  String error = "";
  String message = "";
  //Functions
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => randomNumber());
  }

  Future getData(value) async {
    var rsp = await fetchPrecint(value);

    if (rsp['data'] != null) {
      var data = new Map<String, dynamic>.from(rsp['data']);
      setState(() {
        _show = true;
        message = data['barangay'] +
            " " +
            data['municipality'] +
            " " +
            data['province'] +
            " " +
            data['region'];
      });
    } else {
      setState(() {
        _show = false;
        message = rsp['message'];
      });
    }
  }

  void randomNumber() {
    var random = new Random();

    int min = 99999;

    int max = 999999;

    String result = (min + random.nextInt(max - min)).toString();

    setState(() {
      _controller.text = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Incident Report'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(0.0),
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 10),
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
              Container(
                child: Text(
                  message,
                  style: TextStyle(
                      color: Color.fromARGB(255, 20, 20, 20), fontSize: 14.0),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(0.0),
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Container(
                  child: TextFormField(
                    controller: _controller,
                    readOnly: true,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Incident Reference Number'),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(0.0),
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Container(
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(), labelText: 'Details'),
                    ),
                  )),
              Visibility(
                visible: _show,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(0.0),
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: const EdgeInsets.all(0),
                ),
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
