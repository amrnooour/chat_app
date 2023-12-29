import 'package:chat_app/data/firestore_helper.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/ui/screens/chat/chat_view_model.dart';
import 'package:chat_app/ui/utils/app_assets.dart';
import 'package:chat_app/ui/widgets/message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  static const routeName = "chat";
  ChatViewModel viewModel = ChatViewModel();
  @override
  Widget build(BuildContext context) {
    viewModel .roomId = ModalRoute.of(context)!.settings.arguments as String;
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
              child:  Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: StreamBuilder<QuerySnapshot<Message>>(
                      stream: getMessageList(viewModel.roomId),
                      builder: (context,snapshot){
                        if(snapshot.hasError){
                          return Text(snapshot.error.toString());
                        }else if(snapshot.hasData){
                          var messages = snapshot.data!.docs.map((doc) => doc.data()).toList();
                          return ListView.builder(
                            itemCount: messages.length,
                            itemBuilder: (context,index){
                              return MessageWidget(message: messages[index],);
                            },
                          );
                        }else{
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                           Expanded(
                            child: TextField(
                              onChanged: (text){
                                viewModel.content =text;
                              },
                              controller: viewModel.controller,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(12)),
                                      borderSide: BorderSide(color: Colors.grey)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(12)),
                                      borderSide: BorderSide(color: Colors.grey)
                                  ),
                                  hintText: "Type a message"
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(onPressed: (){
                              viewModel.sendMessage();
                            }, child: Row(
                              children: [
                                Text("Send"),
                                Icon(Icons.send,size: 15,)
                              ],
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
