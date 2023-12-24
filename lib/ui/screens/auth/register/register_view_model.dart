import 'package:chat_app/data/firestore_helper.dart';
import 'package:chat_app/model/my_user.dart';
import 'package:chat_app/ui/screens/auth/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  RegisterNavigator? navigator;
  void createAccount() async{
    try {
      navigator!.showLoading();
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      MyUser appUser =MyUser(id: credential.user!.uid, email: emailController.text, userName: nameController.text);
      await saveFirestoreUser(appUser);
      navigator!.hideLoading();
      navigator!.goBackToLogin();
    } on FirebaseAuthException catch (e) {
      navigator!.hideLoading();
      if (e.code == 'weak-password') {
        navigator!.showMyDialog("weak-password");
      } else if (e.code == 'email-already-in-use') {
        navigator!.showMyDialog("email-already-in-use");
      }else {
        navigator!.showMyDialog(e.message??"something went wrong please try again later..");
      }
    } catch (e) {
      print(e);
    }
  }
}