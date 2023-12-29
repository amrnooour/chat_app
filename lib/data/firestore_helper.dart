import 'package:chat_app/model/message.dart';
import 'package:chat_app/model/my_user.dart';
import 'package:chat_app/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveFirestoreUser(MyUser user){
  return FirebaseFirestore.instance.collection("users").doc(user.id).set({
    "id" : user.id,
    "email" : user.email,
    "userName" : user.userName
  });
}
Future<DocumentSnapshot<Map<String,dynamic>>> getFirestoreUser(String id){
   return FirebaseFirestore.instance.collection("users").doc(id).get();
}
CollectionReference<Room> getRoomsCollections(){
  return FirebaseFirestore.instance.collection("rooms").withConverter<Room>
    (fromFirestore: (snapshot,_) => Room.fromJson(snapshot.data()!),
      toFirestore: (room,_) => room.toJson());
}
CollectionReference<Message> getMessageCollections(String roomId){
  return FirebaseFirestore.instance.collection("rooms").doc(roomId).collection("messages").withConverter<Message>(
      fromFirestore : (snapshot ,_) => Message.fromJson(snapshot.data()!),
      toFirestore: (message,_) => message.toJson());
}

Future createRoomInFireStore(Room room){
  var doc = getRoomsCollections().doc();
  room.id =doc.id;
  return doc.set(room);
}
Stream<QuerySnapshot<Room>> getRoomsList(){
  return getRoomsCollections().snapshots();
}
Stream<QuerySnapshot<Message>> getMessageList(String roomId){
  return getMessageCollections(roomId).orderBy("dateTime").snapshots();
}
Future sendMessageInFireStore(Message message){
  var doc =getMessageCollections(message.roomId).doc();
  message.id =doc.id;
  return doc.set(message);
}