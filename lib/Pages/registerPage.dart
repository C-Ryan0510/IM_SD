import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:untitled/utils.dart';

class registerPage extends StatefulWidget{
  // final Function togglePage;

  const registerPage({Key? key}) : super(key: key);
  // @overrided
  // registerPage({ required this.togglePage,});

  @override
  State<StatefulWidget> createState() => _registerState();
}

class _registerState extends State<registerPage>{
  final _formKey = GlobalKey<FormState>();
  //text Editor
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final passcheckController = TextEditingController();

  final BoxOutline = OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(45, 224, 213, 86), width: 2.0), borderRadius: BorderRadius.circular(200),);
  final ErorrOutline = OutlineInputBorder(borderSide: BorderSide(color: Colors.red.withOpacity(0.86), width: 2.0), borderRadius: BorderRadius.circular(200),);

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // passcheckController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>Scaffold(
    resizeToAvoidBottomInset: false,
    // backgroundColor: Colors.white,
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 100),
      child: Stack(
        children: <Widget>[
          Positioned( left: 50,
            child: Text('註冊',style: TextStyle(fontSize: 40, color: Color.fromRGBO(45, 224, 213, 100)),),),
          ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            padding: EdgeInsets.symmetric(horizontal: 40,),
            children: [
              SizedBox(height: 200,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: '請輸入信箱',
                  labelStyle: TextStyle(color: Color.fromRGBO(48, 92, 84, 100),),
                  enabledBorder: BoxOutline,
                  focusedBorder: BoxOutline,
                  errorBorder: ErorrOutline,
                  focusedErrorBorder: ErorrOutline,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.email_outlined,color: Colors.black,),
                  ),
                ),
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) {/*email_validator needed add in pubspec.yaml*/
                  if(email != null && !EmailValidator.validate(email)){
                    return '請輸入有效的信箱';
                  }
                  return null;
                }
              ),
              SizedBox(height: 30,),//間隔
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '請輸入密碼',
                  labelStyle: TextStyle(color: Color.fromRGBO(48, 92, 84, 100),),
                  enabledBorder: BoxOutline,
                  focusedBorder: BoxOutline,
                  errorBorder: ErorrOutline,
                  focusedErrorBorder: ErorrOutline,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.lock_outline,color: Colors.black,),
                  ),
                ),
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if(value != null && value.length < 6){
                    return '請設立長度至少為6的密碼';
                  }
                  return null;
                }
              ),
              SizedBox(height: 30,),//間隔
              ElevatedButton(
                child: Text('註冊新帳號',style: TextStyle(fontSize:20 ,fontWeight: FontWeight.bold ,color: Color.fromRGBO(48, 92, 84, 100)),),
                onPressed: CreateNewAcc,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                      side: BorderSide(color: Color.fromRGBO(45, 224, 213, 86)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),//間隔
            ],
          ),
          IconButton(//To put it on top of ListView so it can be onPressed
            alignment: Alignment.bottomCenter,
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 40,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    ),
  );

  // Future SignUp() async {
  //   CreateNewAcc();
  // }
  Future CreateNewAcc() async {
    //Formfields 的狀態都有效(validate)的話，放行/*null problems*/
    // final isValid = _formKey.currentState.validate();
    // if(!isValid) return;//YOU SHALL NOT PASS!!!
    showDialog(//load time
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try{
      await
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ).then((value)
      => FirebaseFirestore.instance.collection('Users_Profile').doc(FirebaseAuth.instance.currentUser!.email.toString())
          .set({
        'user_ID/account': FirebaseAuth.instance.currentUser!.email,
        'user_name': '',
        'user_age': '',
        'user_phoneNumber': '',
        // 'IsFirstTime': true,
      })).then((value)
      => FirebaseAuth.instance.signOut(),
      );
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseException catch (e) {
      print(e);
      /*Exception 帳號已存在*/
      Utils.showSnackBar(e.message);
      navigatorKey.currentState!.pop();
    }
  }
}
