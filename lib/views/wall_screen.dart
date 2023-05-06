import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/components/alert_dialog1.dart';
import 'package:wallpapers_app/provider/scroll_provider.dart';

import 'package:wallpapers_app/provider/wallpapers_controller.dart';

import '../services/fetch_wall.dart';
import '../widgets/poplarCaregory.dart';
import '../widgets/wallgrid.dart';

class  WallScreen extends StatefulWidget {


  const WallScreen({super.key});

  @override
  State<WallScreen> createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  final gapBetweenWidget =const SizedBox(height: 10,);
   TextEditingController textEditingController = TextEditingController();
 ScrollController scrollController = ScrollController();

     @override
  void dispose() {

    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      // appBar: AppBar(leading: IconButton(onPressed: ()async{


      // },icon:const Icon(Icons.add),),),
body: 
SafeArea(
  child:   SizedBox(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: SingleChildScrollView(
      physics:const BouncingScrollPhysics(),
      child: Column(
      
        // controller: scrollController,
      
      
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      
              children: [
      
                Padding(padding:const EdgeInsets.all(10),
      
            child: TextFormField(
      
            controller: textEditingController,
      
            decoration: InputDecoration(
      
            suffixIcon: IconButton(icon:const Icon(Icons.search),onPressed: (){

              if(textEditingController.text.isEmpty && textEditingController.text==''){
  showDialog(context: context, builder: (index){
    return AlertDialog1(text: 'Enter Some Value');
  });

}else{
  
              final wallprovider = Provider.of<WallpapersProvider>(context,listen: false);
      
              wallprovider.fetchWalls(textEditingController.text.trim());
}
      
      
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
      
              child: Text('CATEGORIES',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold,letterSpacing: 4),),
      
             ),
      
            gapBetweenWidget,
      
           
      
          PopularCategoryWidget(controller:scrollController),
      
           gapBetweenWidget,
      
           Container(
      
              padding:const EdgeInsets.symmetric(horizontal: 10),
      
              child: Text('POPULAR',style: Theme.of(context).textTheme.headlineSmall,),
      
             ),
      
              gapBetweenWidget,
      
           
      
           WallGrid(),
      
              ],
      
            
      
           ),
    ),
  ),
),
// floatingActionButton: Consumer<ScrollProvider>(builder: (context, value, child){
//   return value.showBackToTopButton ==false ? Container():FloatingActionButton(onPressed: ()=>value.scrollToTop(),child:const Icon(Icons.arrow_upward),);
// },) ,
    );
  }
}