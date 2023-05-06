import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/provider/wallpapers_controller.dart';

class PopularCategoryWidget extends StatelessWidget {
  final ScrollController controller;
  const PopularCategoryWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {

 
     List categoryList =[
      {
"title": "Wallpapers",
"image":'https://images.unsplash.com/photo-1559291001-693fb9166cba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fHdhbGxwYXBlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  
    },
          {
"title": "Culture",
"image":'https://images.unsplash.com/photo-1679301429781-dd27a5880099?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE1fGJEbzQ4Y1Vod25ZfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    },
    {
"title": "Experimental",
"image":'https://images.unsplash.com/photo-1681944364586-6b31cc3ae47c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDl8cVBZc0R6dkpPWWN8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',


    },
   {
     "title": "Athletics",
    "image":'https://images.unsplash.com/photo-1681491313239-9d0033095fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE5fEJuLURqcmNCcndvfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',

   },
    {
     "title": "Animals",
    "image":'https://images.unsplash.com/photo-1564349683136-77e08dba1ef7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YW5pbWFsc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',

   },
    {
     "title":       "Patterns",
    "image":'https://images.unsplash.com/photo-1621423028668-d5f9555ebea3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8UGF0dGVybnN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',

   },
    {
     "title":"People",
    "image": 'https://images.unsplash.com/photo-1517486808906-6ca8b3f04846?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVvcGxlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',

   },
    {
     "title":    "travel",
    "image":'https://images.unsplash.com/photo-1534534573898-db5148bc8b0c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fHRyYXZlbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',

   },
     {
     "title": "Photography",
    "image":'https://images.unsplash.com/photo-1568819107248-c5ebc8b62fad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGNhbWVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',

   },
     {
     "title":    "gym",
    "image":'https://images.unsplash.com/photo-1623874106686-5be2b325c8f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTF8fGd5bXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',

   },
     {
     "title":     "vication",
    "image":'https://images.unsplash.com/photo-1678510131367-df8d6c61b17e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNTd8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',

   },
    ];
    return SizedBox(
      height: 110,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        
        // controller: controller,
      dragStartBehavior: DragStartBehavior.down,
      primary: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              
              itemBuilder: (context,index){
              return      GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  final wallpaperProvider= Provider.of<WallpapersProvider>(context,listen:false);
                  wallpaperProvider.fetchWalls(categoryList[index]['title']);
                },
                child: Container(
                  width: 100,
                  // constraints: BoxConstraints(minWidth: 60,
                  // maxWidth: MediaQuery.of(context).size.width/2
                  // ),
                  padding:const EdgeInsets.all(10),
                  margin:const EdgeInsets.symmetric(vertical: 4,horizontal: 7),
                      
                      decoration: BoxDecoration(color: Colors.black54,
                      
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: NetworkImage(categoryList[index]['image']),fit: BoxFit.cover),
                      // image: null,
                       
                      ),
                      // width: MediaQuery.of(context).size.width/2,
                      alignment: Alignment.center,
                 
                      // child: Text(categoryText[index],textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall,),
                 
                 child: Text(categoryList[index]['title'].toString(),
                 style: TextStyle(fontSize: 16),
                 ),
                    ),
              );
             }),
    );
  }
}