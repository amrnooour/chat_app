import 'package:chat_app/model/room.dart';
import 'package:chat_app/ui/screens/chat/chat.dart';
import 'package:chat_app/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

class RoomWidget extends StatelessWidget {
  Room room;
  RoomWidget({required this.room});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.pushNamed(context, Chat.routeName,arguments: room.id);},
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          SizedBox(height: 10,),
          Expanded(child: Image.asset(getImagePath()??"")),
          SizedBox(height: 10,),
          Text(room.title??"",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
        ],),
      ),
    );
  }
  getImagePath(){
    if(room.categoryId == 1){
      return AppAssets.sports;
    }else if(room.categoryId == 2){
      return AppAssets.music;
    }else{
      return AppAssets.movies;
    }
  }
}
