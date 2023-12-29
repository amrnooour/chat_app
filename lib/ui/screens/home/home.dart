import 'package:chat_app/data/firestore_helper.dart';
import 'package:chat_app/model/room.dart';
import 'package:chat_app/ui/screens/add_room/add_room.dart';
import 'package:chat_app/ui/utils/app_assets.dart';
import 'package:chat_app/ui/widgets/room_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName = "home";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(
          image: AssetImage(AppAssets.backGround,), fit: BoxFit.cover),
          color: Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Home"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(14),
          child: StreamBuilder<QuerySnapshot<Room>>(
            stream: getRoomsList(),
            builder: (context,snapshot){
              if(snapshot.hasError){
                return Text(snapshot.error.toString());
              }else if(snapshot.hasData){
                var rooms = snapshot.data!.docs.map((doc) => doc.data()).toList();
                return GridView.builder(
                  itemCount: rooms.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context,index){
                    return RoomWidget(room: rooms[index],);
                    });
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context, AddRoom.routeName);
        },
        child: Icon(Icons.add),
        ),
      ),
    );
  }
}
