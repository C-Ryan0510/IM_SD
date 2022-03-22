import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_ui/data/users.dart';
import 'package:login_ui/model/user.dart';
import 'package:login_ui/widget/text_dialog_widget.dart';
import 'package:login_ui/page/completepage.dart';

Future loginUser(String email, String password) async {
  //String url = 'http://10.0.2.2/api/login';

  String url =
      'http://qkapi-1130225346.ap-southeast-1.elb.amazonaws.com/api/login';

  Uri url2 = Uri.parse(url);
  var device = "samsung";
  final response = await http.post(url2,
      headers: {"Accept": "Application/json"},
      body: {'email': email, 'password': password, 'device_name': device});
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}

Future registerUser(
    String email, String password, String confirm_password, String name) async {
  //String url = 'http://10.0.2.2/api/login';

  String url =
      'http://qkapi-1130225346.ap-southeast-1.elb.amazonaws.com/api/register';

  Uri url2 = Uri.parse(url);
  var device = "samsung";
  final response = await http.post(url2, headers: {
    "Accept": "Application/json"
  }, body: {
    'email': email,
    'password': password,
    'device_name': device,
    'name': name,
    'confirm_password': confirm_password
  });
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}

Future SubmitData(List users) async {
  // print(users);
  final _storage = FlutterSecureStorage();
  // String url = 'http://10.0.2.2/api/votes';
  String url =
      'http://qkapi-1130225346.ap-southeast-1.elb.amazonaws.com/api/votes';

  Uri url2 = Uri.parse(url);
  var nb = users.length;
  var token = await _storage.read(key: 'token');
  var precint = await _storage.read(key: 'precint');
  var elpos = await _storage.read(key: 'position');
  String? level = "National";
  //print('Token : ${token}');

  for (var i = 0; i < nb; i++) {
    String? fName = users[i].firstName;
    String? lName = users[i].lastName;
    var botos = users[i].boto.toString();

    final Map<String, dynamic> activityData = {
      "firstname": fName,
      "lastname": lName,
      "elect_position": elpos,
      "level": level,
      "precint_code": precint,
      "nb_votes": botos
    };

    if (users[i].boto > 0) {
      final response = await http.post(url2,
          headers: {'Authorization': 'Bearer $token'}, body: activityData);
      var convertedDatatoJson = jsonDecode(response.body);
      // return convertedDatatoJson
    }
    ;
  }
  ;
  return;
}

Future fetchPrecint(String precint_code) async {
  final _storage = FlutterSecureStorage();

  String url =
      'http://qkapi-1130225346.ap-southeast-1.elb.amazonaws.com/api/precints';

  String sUrl = url + '/' + precint_code;
  print(sUrl);

  Uri url2 = Uri.parse(sUrl);
  var token = await _storage.read(key: 'token');
  final response = await http.get(
    url2,
    headers: {'Authorization': 'Bearer $token'},
  );
  final convertedDatatoJson = jsonDecode(response.body);
  var mapping = Map<String, dynamic>.from(convertedDatatoJson);

  print(mapping);
  return mapping;
}

Future fetchCandidates() async {
  final _storage = FlutterSecureStorage();

  String url =
      'http://qkapi-1130225346.ap-southeast-1.elb.amazonaws.com/api/candidates';

  Uri url2 = Uri.parse(url);
  var token = await _storage.read(key: 'token');
  final response = await http.get(
    url2,
    headers: {'Authorization': 'Bearer $token'},
  );
  final convertedDatatoJson = jsonDecode(response.body);

  return convertedDatatoJson;
}
