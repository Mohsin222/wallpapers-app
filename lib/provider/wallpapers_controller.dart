import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:wallpapers_app/models/wallpaper_model.dart';
import 'package:wallpapers_app/services/fetch_wall.dart';

class WallpapersProvider extends ChangeNotifier{


WallpapersProvider(){
  fetchWalls('model');
}

bool loading =false;

List<Wallpapers> wallsList=[];
  fetchWalls(String value)async{
    loading=true;
    wallsList=[];
    notifyListeners();

    var data =await FetchWalls.fetchWalls(value);

// log(data.toString());

          for (var i in data) {
    //    print(i);
 Wallpapers wallpapers = Wallpapers.fromMap(i);

        wallsList.add(wallpapers);
      }

      log(wallsList.toString());

notifyListeners();

  }
  
}