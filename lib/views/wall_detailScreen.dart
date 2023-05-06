
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wallpapers_app/provider/wallpapers_controller.dart';

class WallDetailScreen extends StatelessWidget {
 final String url;
 final int index;
  const WallDetailScreen({
    Key? key,
    required this.url,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<WallpapersProvider>(
      builder: (context,value,child) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(onPressed: ()=>Navigator.pop(context)),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black54,
            onPressed: ()async{
       
            value.saveNetworkImage(imagePath :url,context: context);
          },child:value.downloadLoading==false ? const Icon(Icons.download,color: Colors.white,): CircularProgressIndicator(color:Colors.white,),),
          body: Container(
            height: MediaQuery.of(context).size.height,
          //  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(url),fit: BoxFit.contain)),
          
          child: Column(
            children: [
              // SizedBox(height: 60,),
            //   Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     IconButton(onPressed: ()=>Navigator.pop(context), icon:const Icon(Icons.arrow_back,size: 35,))
            //   ],
          
            // ),
            Expanded(
              child: Hero(
                tag: 'alpha'+index.toString(),
                child: Image.network(url,fit: BoxFit.cover,),
              ),
            ),
            
            ],
            
          ),
          ),
        );
      }
    );
  }
}
