import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/provider/wallpapers_controller.dart';

class PopularCategoryWidget extends StatelessWidget {
  const PopularCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> categoryText=[
      "Wallpapers",
      "Travel",
      "Experimental",
      "Animals",
      "Patterns"
      "People",
      "travel",
      "hot",
      "gym",
      "vication"
    ];
    List<String> categoryImages=[
      'https://plus.unsplash.com/premium_photo-1672576784701-b960e7cb37d6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1678750267527-4c3f55e32149?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1678786202821-cd5cd3fa3f3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0Nnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1678737176644-99fdb97795cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1678711268282-8271e997afa1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1599447472329-449d9e262420?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
'https://plus.unsplash.com/premium_photo-1663039931695-c5fc4a2e0b41?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMTB8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1534872724459-3a23213491fc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1678540939206-e32d7ff93474?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNTV8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1678510131367-df8d6c61b17e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNTd8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ];
    return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryText.length,
            itemBuilder: (context,index){
            return      InkWell(
              onTap: (){
                final wallpaperProvider= Provider.of<WallpapersProvider>(context,listen:false);
                wallpaperProvider.fetchWalls(categoryText[index]);
              },
              child: Container(
                width: 100,
                constraints: BoxConstraints(minWidth: 60,
                maxWidth: MediaQuery.of(context).size.width/2
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 4,horizontal: 7),
                    
                    decoration: BoxDecoration(color: Colors.red[400],
                    
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: NetworkImage(categoryImages[index]),fit: BoxFit.cover),
                     
                    ),
                    // width: MediaQuery.of(context).size.width/2,
                    alignment: Alignment.center,
               
                    child: Text(categoryText[index],textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall,),
                  ),
            );
           });
  }
}