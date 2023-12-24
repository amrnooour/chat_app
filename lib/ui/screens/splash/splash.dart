import 'package:chat_app/ui/screens/auth/login/login.dart';
import 'package:chat_app/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const routeName = "splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppAssets.splashScreen,fit: BoxFit.cover,),
    );
  }
}
