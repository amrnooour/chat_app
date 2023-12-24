import 'package:chat_app/model/my_user.dart';
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