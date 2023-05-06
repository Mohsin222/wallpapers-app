import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:wallpapers_app/views/wall_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void nextScreen(BuildContext context){
    // Navigator.pushNamed(context, MaterialPageRoute(builder: (context)=> WallScreen()));
Future.delayed(Duration(seconds: 10), (){
   Navigator.push(context, MaterialPageRoute(builder: (context)=> WallScreen()));
});
  }

  @override
  Widget build(BuildContext context) {
    nextScreen(context);
    return  Scaffold(


      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/splash.jpg'),fit: BoxFit.cover),
             gradient: LinearGradient(
      colors: [
  //  Color(0xffff512f ),
  //        Color(0xffdd2476),
              Color(0xff434343),
                  Color(0xff000000 ),
                   
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimateList(
            interval: 400.ms,
  effects: [FadeEffect(duration:1000.ms)],
            children:  [
              Spacer(),
    
           SizedBox(height: 20,),
        
           Text('Download Wallpapers'.toUpperCase(),style: TextStyle(
         fontFamily: 'Dancing Script',
         fontSize: 40,
         letterSpacing: 4,
         fontWeight: FontWeight.w900
           ),),
           SizedBox(height: 20,),

          //  ElevatedButton(onPressed: (){}, child: Text(''))
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width/1.5,
            child: SwipeButton(
            trackPadding: EdgeInsets.all(2),
            activeTrackColor: Colors.black54,
            elevationThumb: 2,
            activeThumbColor: Colors.grey[200],
            child: Text(
              "Swipe to ...",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onSwipe: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> WallScreen()));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Swipped"),
                  backgroundColor: Colors.grey,
                ),
              );
            },
          ),
          )
          ],
          ).slide(),
        ),
      ),
    );
  }
}