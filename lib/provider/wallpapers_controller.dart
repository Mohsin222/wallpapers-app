import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpapers_app/components/toast_message.dart';

import 'package:wallpapers_app/models/wallpaper_model.dart';
import 'package:wallpapers_app/services/fetch_wall.dart';

class WallpapersProvider extends ChangeNotifier{


WallpapersProvider(){
  fetchWalls('model');
}

bool loading =true;

List<Wallpapers> wallsList=[];
  fetchWalls(String value)async{
    loading=true;
    wallsList=[];
    print(loading);
    notifyListeners();

    var data =await FetchWalls.fetchWalls(value);

// log(data.toString());

          for (var i in data) {
    //    print(i);
 Wallpapers wallpapers = Wallpapers.fromMap(i);

        wallsList.add(wallpapers);
      }

  
loading=false;
notifyListeners();

  }
  
bool downloadLoading=false;
  void saveNetworkImage({required String imagePath, required BuildContext context}) async {

    downloadLoading=true;
    notifyListeners();
    String path ='$imagePath.jpg';
    GallerySaver.saveImage(path).then(( success) {
     
        print('Image is saved');
        downloadLoading=false;
        toastMessage(context: context, text: 'Image is Downloaded');
   notifyListeners();
  
    }).catchError((err){
      toastMessage(context: context, text: 'Error in download');
      print(err);
    });
  }
}