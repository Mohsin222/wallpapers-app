import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'package:wallpapers_app/provider/wallpapers_controller.dart';
import 'package:wallpapers_app/views/wall_detailScreen.dart';

import '../models/wallpaper_model.dart';
import '../provider/scroll_provider.dart';

class WallGrid extends StatelessWidget {

final ScrollController controller;

List<String> images=[
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
'https://images.unsplash.com/photo-1605842946381-9d0d58e03d46?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1571984269640-474565658a7f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fGh1bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1529903384028-929ae5dccdf1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1682562168496-c7a11e48f206?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1682997843692-c3cf1cb9caf9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1682685797507-d44d838b0ac7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw0MHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1682839959527-dba0e697a430?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0NHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
'https://images.unsplash.com/photo-1682289571248-cbcb6c89c048?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
 'https://plus.unsplash.com/premium_photo-1672576784701-b960e7cb37d6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1678750267527-4c3f55e32149?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1678786202821-cd5cd3fa3f3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0Nnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1678737176644-99fdb97795cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1678711268282-8271e997afa1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
];

   WallGrid({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Consumer<WallpapersProvider>(

      builder: (context, value,child) {
        // final scrollProvider= Provider.of<ScrollProvider>(context,listen:false);
        return SizedBox(
          height: (value.wallsList.length<10) ? size.height: (value.wallsList.length> 20) ? size.height*3:(value.wallsList.length>30)? size.height*4 :(value.wallsList.length>30)? size.height*4:(images.length>40)? size.height*4 : (value.wallsList.length>50)? size.height*4:size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: MasonryGridView.builder(
              // physics: const NeverScrollableScrollPhysics(),
        controller: controller,
            physics: AlwaysScrollableScrollPhysics(parent: NeverScrollableScrollPhysics()),
     
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
              itemCount: value.wallsList.length,
              itemBuilder: (context, index) { 
     
                return Padding(
            padding: const EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>WallDetailScreen(url: value.wallsList[index].title.toString())));
                    },
                    child: Image.network(value.wallsList[index].title.toString(),fit: BoxFit.cover,),),),
              );}),
          ),
        );
      }
    );
  }
}