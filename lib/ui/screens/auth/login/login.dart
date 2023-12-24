import 'package:chat_app/ui/screens/auth/login/login_navigator.dart';
import 'package:chat_app/ui/screens/auth/login/login_view_model.dart';
import 'package:chat_app/ui/screens/auth/register/register.dart';
import 'package:chat_app/ui/screens/home/home.dart';
import 'package:chat_app/ui/utils/app_assets.dart';
import 'package:chat_app/ui/widgets/custom_button.dart';
import 'package:chat_app/ui/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const routeName = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> implements LoginNavigator{
  LoginViewModel viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.navigator =this;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.backGround,),fit: BoxFit.cover),
        color: Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Login"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height*.3,),
                const Text("Welcome back!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                const SizedBox(height: 20,),
                CustomTextField(label: "Email", controller: viewModel.emailController, isPassword: false, type: TextInputType.text),
                const SizedBox(height: 10,),
                CustomTextField(label: "password", controller: viewModel.passwordController, isPassword: true, type: TextInputType.text),
                const SizedBox(height: 15,),
                const Text("forgot password",style: TextStyle(fontSize: 12,color: Colors.black),),
                const SizedBox(height: 20,),
                CustomButton(onPressed: (){
                  viewModel.login();
                }, text: "Login"),
                const SizedBox(height: 20,),
                InkWell(
                    onTap: () => Navigator.pushNamed(context, Register.routeName),
                    child: const Text("Or Create account",style: TextStyle(fontSize: 15,color: Colors.black),)),
              ],
            ),
          ),
        ),
      ),
    );
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

  @override
  navigateToHomeScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
  }
}