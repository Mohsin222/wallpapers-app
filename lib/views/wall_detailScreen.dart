// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WallDetailScreen extends StatelessWidget {
 final String url;
  const WallDetailScreen({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(url),fit: BoxFit.contain)),
        
        child: Column(
          children: [Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back,size: 35,))
            ],
          )],
        ),
        ),
      ),
    );
  }
}
