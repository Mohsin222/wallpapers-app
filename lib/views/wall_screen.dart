import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/provider/scroll_provider.dart';

import 'package:wallpapers_app/provider/wallpapers_controller.dart';

import '../services/fetch_wall.dart';
import '../widgets/poplarCaregory.dart';
import '../widgets/wallgrid.dart';

class  WallScreen extends StatelessWidget {

  final gapBetweenWidget =const SizedBox(height: 10,);

  const WallScreen({super.key});
    

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: ()async{


      },icon:const Icon(Icons.add),),),
body: 
 Consumer<ScrollProvider>(
  
   builder: (context, value,child) {
     return ListView(
  controller: value.scrollController,
   primary: false,
   shrinkWrap: true,
        children: [
          Padding(padding:const EdgeInsets.all(10),
      child: TextFormField(
      controller: value.textEditingController,
      decoration: InputDecoration(
      suffixIcon: IconButton(icon:const Icon(Icons.search),onPressed: (){
        final wallprovider = Provider.of<WallpapersProvider>(context,listen: false);
        wallprovider.fetchWalls(value.textEditingController.text.trim());
      },),
          hintText:'Search',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            borderSide:const BorderSide(color: Colors.greenAccent, width: 1.0,),
        ),
      ),
      ),
      ),
     
     
   const    SizedBox(height: 10,),
     
       Container(
        padding:const EdgeInsets.symmetric(horizontal: 10),
        child: Text('CATEGORIES',style: Theme.of(context).textTheme.headlineMedium,),
       ),
      gapBetweenWidget,
     
   const SizedBox(
      height: 90,
      
       child: PopularCategoryWidget(),
     
     
     ),
     gapBetweenWidget,
     Container(
        padding:const EdgeInsets.symmetric(horizontal: 10),
        child: Text('POPULAR',style: Theme.of(context).textTheme.headlineSmall,),
       ),
        gapBetweenWidget,
     
     WallGrid(controller :value.scrollController),
        ],
      
     );
   }
 ),
floatingActionButton: Consumer<ScrollProvider>(builder: (context, value, child){
  return value.showBackToTopButton ==false ? Container():FloatingActionButton(onPressed: ()=>value.scrollToTop(),child:const Icon(Icons.arrow_upward),);
},) ,
    );
  }
}