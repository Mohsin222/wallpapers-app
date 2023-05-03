import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/wallpaper_model.dart';

class FetchWalls{
 static   List<Wallpapers> walls = [];
   static Future fetchWalls(String value)async{
    



// http://localhost:3000/wallpapers/wall11

// https://tame-gold-mackerel-tutu.cyclic.app/wallpapers/wall/$value
    
            final response = await http
        .get(Uri.parse('https://tame-gold-mackerel-tutu.cyclic.app/wallpapers/wal/$value'));

    var data = jsonDecode(response.body.toString());
print(data.toString());
 if (response.statusCode == 200) {
  
//extra\

//         for (var i in data) {
//     //    print(i);
//  Wallpapers wallpapers = Wallpapers.fromMap(i);

//         walls.add(wallpapers);
//       }
   
      

      return response.body;
    } else {
      return [];
    }
        
  }
}