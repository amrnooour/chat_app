import 'package:chat_app/model/category.dart';
import 'package:chat_app/ui/screens/add_room/add_room_navigator.dart';
import 'package:chat_app/ui/screens/add_room/add_room_view_model.dart';
import 'package:chat_app/ui/utils/app_assets.dart';
import 'package:chat_app/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddRoom extends StatefulWidget {
  static const routeName = "addRoom";

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> implements AddRoomNavigator{
  AddRoomViewModel viewModel =AddRoomViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.navigator =this;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          title: Text("Add New Room"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(color: Colors.white,),
            height: height*.8,
            width: width*.9,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 12,),
                        Text("Create New group",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                        Image.asset(AppAssets.room),
                        CustomTextField(label: "", controller: viewModel.titleController, isPassword: false, type: TextInputType.text,hint: "Room title",),
                        DropdownButton<Category>(
                            items: Category.categores.map((category){
                              return DropdownMenuItem(child: Row(children: [
                                Image.asset(category.imagePath),SizedBox(width: 12,), Text(category.name)
                              ],),value: category,);
                            }).toList(),
                            onChanged: (cat){
                              viewModel.selectedCategory =cat ?? viewModel.selectedCategory;
                              setState(() {
                              });
                        },
                          value: viewModel.selectedCategory,
                        ),
                        CustomTextField(label: "", controller: viewModel.descriptionController, isPassword: false, type: TextInputType.text,hint: "Description",),
                        SizedBox(height: 12,),
                        ElevatedButton(onPressed: (){
                          viewModel.craeteRoom();
                        },
                            child: Center(child: Text("Create room")))
                      ],
                    ),
                  ),
                ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  backToHome() {
    Navigator.pop(context);
  }

  @override
  hideLoading() {
    Navigator.pop(context);
  }

  @override
  showMyDialog(String message) {
    showDialog(context: context,barrierDismissible: false, builder: (context){
      return AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok"))
        ],
      );
    });
  }

  @override
  showLoading() {
    showDialog(context: context,barrierDismissible: false, builder: (context){
      return AlertDialog(
        content: Row(
          children: [
            Text("Loading"),
            Spacer(),
            CircularProgressIndicator()
          ],
        ),
      );
    });
  }
}