import 'package:chat_app/model/message.dart';
import 'package:chat_app/model/my_user.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  Message message;
  MessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return message.senderId == MyUser.currentUser!.id
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(top: 18,left: 4,right: 4),
                      child: Text(
                        getDateFormate(DateTime.fromMicrosecondsSinceEpoch(
                            message.dateTime)),
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(14),
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14))),
                      child: Text(
                        message.content,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    width: double.infinity,
                    child: Text(
                      message.senderName,
                      textAlign: TextAlign.start,
                    )),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(14),
                              topLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14))),
                      child: Text(
                        message.content,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 18,left: 4,right: 4),
                      child: Text(
                        getDateFormate(DateTime.fromMicrosecondsSinceEpoch(
                            message.dateTime)),
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          );
  }

  getDateFormate(DateTime dateTime) {
    return "${dateTime.hour} : ${dateTime.minute}";
  }
}
