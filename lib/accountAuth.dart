// import 'Pages/login_page.dart';
// import 'Pages/registerPage.dart';
import 'package:flutter/material.dart';

class AuthPageSwitch extends StatefulWidget {
  const AuthPageSwitch({Key? key}) : super(key: key);

  @override
  State<AuthPageSwitch> createState() => _accountAuthState();
}

class _accountAuthState extends State<AuthPageSwitch> with SingleTickerProviderStateMixin{
  bool TogglePage = true;
  void toggle() => setState(() => TogglePage = !TogglePage);

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();//null
  }
  // @override
  // Widget build(BuildContext context)
  // =>TogglePage? loginPage(togglePage:toggle):registerPage(togglePage:toggle);
}
