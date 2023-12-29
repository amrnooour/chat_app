import 'package:chat_app/data/firestore_helper.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/model/my_user.dart';
import 'package:flutter/cupertino.dart';

class ChatViewModel{
  String roomId = "";
  String content = "";
  TextEditingController controller = TextEditingController();

  sendMessage() async{
    Message message = Message(content: content, roomId: roomId,
        senderName: MyUser.currentUser!.userName,
        senderId: MyUser.currentUser!.id,
        dateTime: DateTime.now().microsecondsSinceEpoch);
    await sendMessageInFireStore(message);
    controller.clear();
  }
}