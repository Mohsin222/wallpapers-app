import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AlertDialog1 extends StatelessWidget {
  final String text;
  const AlertDialog1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:Colors.black54,
      content: Text(text,style: TextStyle(fontSize: 20),),
      iconColor: Colors.red,
      titlePadding: EdgeInsets.all(40),
      elevation: 10,
        actions: [
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),                     // FlatButton widget is used to make a text to work like a button
                  
                    onPressed: () {
                      Navigator.pop(context);
                    },             // function used to perform after pressing the button
                    child: Text('CANCEL'),
                  ),
                ),
        ]
    );
  }
}