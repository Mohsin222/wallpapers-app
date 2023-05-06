import 'package:flutter/material.dart';
import 'package:wallpapers_app/views/wall_detailScreen.dart';
import 'package:wallpapers_app/views/wall_screen.dart';
class Routes{


  static const String wallScreenRoute = '/';
  static const String detailScreenRoute = '/details';




 static Route<dynamic> generateRoute(RouteSettings settings){

  switch(settings.name){
    case wallScreenRoute:
    return MaterialPageRoute(builder: (_) => WallScreen());

    // case detailScreenRoute:
    // return MaterialPageRoute(builder: (_) =>  WallDetailScreen(url: settings.name!,));


       default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
  }
}
}
