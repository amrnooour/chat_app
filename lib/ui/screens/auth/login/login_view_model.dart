import 'package:chat_app/data/firestore_helper.dart';
import 'package:chat_app/model/my_user.dart';
import 'package:chat_app/ui/screens/auth/login/login_navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginNavigator? navigator;
  void login() async {
    try {
      navigator!.showLoading();
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      DocumentSnapshot<Map<String,dynamic>> doc =await getFirestoreUser(credential.user!.uid);
      var map =doc.data();
      MyUser user = MyUser(id: map!["id"], email: map!["email"], userName: map!["userName"]);
      navigator!.hideLoading();
      navigator!.navigateToHomeScreen();
    } on FirebaseAuthException catch (e) {
      navigator!.hideLoading();
      if (e.code == 'user-not-found') {
        navigator!.showMyDialog("user-not-found");
      } else if (e.code == 'wrong-password') {
        navigator!.showMyDialog("wrong-password");
      }else {
        navigator!.showMyDialog(e.message??"something went wrong please try again later..");
      }
    }
  }
}