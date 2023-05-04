
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wallpapers_app/provider/wallpapers_controller.dart';

class WallDetailScreen extends StatelessWidget {
 final String url;
  const WallDetailScreen({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<WallpapersProvider>(
      builder: (context,value,child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: ()async{
       
            value.saveNetworkImage(imagePath :url,context: context);
          },child:value.downloadLoading==false ? const Icon(Icons.download):const CircularProgressIndicator(),),
          body: SafeArea(
            child: Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(url),fit: BoxFit.contain)),
            
            child: Column(
              children: [Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: ()=>Navigator.pop(context), icon:const Icon(Icons.arrow_back,size: 35,))
                ],
              )],
            ),
            ),
          ),
        );
      }
    );
  }
}
