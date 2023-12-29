import 'package:chat_app/data/firestore_helper.dart';
import 'package:chat_app/model/category.dart';
import 'package:chat_app/model/room.dart';
import 'package:chat_app/ui/screens/add_room/add_room_navigator.dart';
import 'package:flutter/cupertino.dart';

class AddRoomViewModel{
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Category selectedCategory = Category.categores[0];
  AddRoomNavigator? navigator;

  craeteRoom() async{
    navigator!.showLoading();
    Room room =Room("", titleController.text, descriptionController.text, selectedCategory.id);
    await createRoomInFireStore(room);
    navigator!.hideLoading();
    navigator!.backToHome();
  }

}