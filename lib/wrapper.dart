import 'package:flutter/material.dart';
import 'package:login_ui/widget/connectivityAlert.dart';
import 'Screens/login/login.dart';
import 'components/provider/connectivity_provider.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageUI(),
    );
  }

  Widget pageUI() {
    return Consumer<ConnectivityProvider>(builder: (context, model, child) {
      if (model.isOnline != null) {
        return model.isOnline ? LoginScreen() : ConnectivityAlert();
      }

      return Container(
          child: Center(
        child: CircularProgressIndicator(),
      ));
    });
  }
}
