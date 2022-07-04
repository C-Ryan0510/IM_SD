import 'package:flutter/material.dart';

class Drug extends StatefulWidget {
  const Drug({Key? key}) : super(key: key);

  @override
  State<Drug> createState() => _DrugState();
}

class _DrugState extends State<Drug> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Modal BottomSheet'),
            ElevatedButton(
              child: const Text('Close BottomSheet'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
