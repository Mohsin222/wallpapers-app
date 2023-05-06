import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:wallpapers_app/views/wall_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void nextScreen(BuildContext context){
    // Navigator.pushNamed(context, MaterialPageRoute(builder: (context)=> WallScreen()));
Duration();
  }

  @override
  Widget build(BuildContext context) {
    nextScreen(context);
    return  Scaffold(


      body: Container(
        decoration: const BoxDecoration(
             gradient: LinearGradient(
      colors: [
  //  Color(0xffff512f ),
  //        Color(0xffdd2476),
              Color(0xffaa076b),
                  Color(0xff61045f ),
                   
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: AnimateList(
              interval: 400.ms,
  effects: [FadeEffect(duration:1000.ms)],
              children:  [
          SizedBox(
                height: 100,
                width: 200,
                child: Image(image: AssetImage('assets/images/logo.png')),
              ),
             SizedBox(height: 20,),
        
             Text('Download Reels',style: TextStyle(
           fontFamily: 'Dancing Script',
           fontSize: 40,
           letterSpacing: 4,
           fontWeight: FontWeight.w900
             ),)
            ],
            ).slide(),
          ),
        ),
      ),
    );
  }
}