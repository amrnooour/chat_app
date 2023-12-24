import 'package:chat_app/ui/screens/auth/login/login.dart';
import 'package:chat_app/ui/screens/auth/register/register_navigator.dart';
import 'package:chat_app/ui/screens/auth/register/register_view_model.dart';
import 'package:chat_app/ui/utils/app_assets.dart';
import 'package:chat_app/ui/widgets/custom_button.dart';
import 'package:chat_app/ui/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  static const routeName = "register";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> implements RegisterNavigator{
  RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.navigator =this;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.backGround),fit: BoxFit.cover),
        color: Colors.white
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(title: Text("Create account"),centerTitle: true,elevation: 0,backgroundColor: Colors.transparent,),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height*0.3,),
                  CustomTextField(label: "first Name", controller: viewModel.nameController, isPassword: false, type: TextInputType.text),
                  SizedBox(height: 20,),
                  CustomTextField(label: "email", controller: viewModel.emailController, isPassword: false, type: TextInputType.text),
                  SizedBox(height: 20,),
                  CustomTextField(label: "password", controller: viewModel.passwordController, isPassword: true, type: TextInputType.text),
                  SizedBox(height: 50,),
                  CustomButton(onPressed: (){
                    viewModel.createAccount();
                  }, text: "create account"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  goBackToLogin() {
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
