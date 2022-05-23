import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageAccount extends StatefulWidget {
  const ManageAccount({Key? key}) : super(key: key);

  @override
  State<ManageAccount> createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  final _FullNameController = TextEditingController();
  final _AgeController = TextEditingController();
  final _HeiController = TextEditingController();
  final _WeiController = TextEditingController();

  final _phoneController = TextEditingController();

  final User = FirebaseAuth.instance.currentUser;
  final Datas = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.email.toString()).collection('detail').doc('profile');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基本資料與帳號管理'),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40,horizontal: 30),
            child: ListView(
              children: [
                ListTile(
                  title: Text('個人資料'),
                ),
                Divider(thickness: 2),
                TextFormField(
                  controller: _FullNameController,
                  // initialValue: Datas.get(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '姓名',
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: _AgeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '年齡/出生日期',
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: _HeiController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '身高',
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _WeiController,
                  // initialValue: User?.Weight,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '體重',
                  ),
                ),
                Divider(thickness: 5,color: Colors.black,),
                ListTile(
                  title: Text('用戶帳號資訊'),
                ),
                Divider(thickness: 2),
                TextFormField(
                  enabled: false,//重要帳號認證(不可變更No controller)
                  initialValue: User?.email,
                  decoration: InputDecoration(
                    labelText: '電子信箱Email',
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  controller: _phoneController,
                  // initialValue: Datas.,
                  decoration: InputDecoration(
                    labelText: '電話',
                  ),
                ),
                SizedBox(height: 40,)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                child: Text('儲存'),
                onPressed: () => {
                  // Save/Edit
                  print(User), print(Datas),print(Datas.get()),print(FirebaseFirestore.instance.collection('users').get()),//For Test
                  UserDetailUpdate(),
                  Navigator.of(context).pop(),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future UserDetailUpdate() async{
    try{
      await Datas.set({
        'FullName': _FullNameController.text.trim(),
        'Age': _AgeController.text.trim(),
        'Height': _HeiController.text.trim(),
        'Weight': _WeiController.text.trim(),
        'PhoneNumber': _phoneController.text.trim(),
      });
    } on FirebaseException catch(e){
      print(e);
    }
  }
}