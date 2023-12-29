import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/ui/screens/add_room/add_room.dart';
import 'package:chat_app/ui/screens/auth/login/login.dart';
import 'package:chat_app/ui/screens/auth/register/register.dart';
import 'package:chat_app/ui/screens/chat/chat.dart';
import 'package:chat_app/ui/screens/home/home.dart';
import 'package:chat_app/ui/screens/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Login.routeName :(_)=> Login(),
        Register.routeName :(_)=> Register(),
        Splash.routeName :(_)=> Splash(),
        Home.routeName :(_)=> Home(),
        AddRoom.routeName :(_) =>AddRoom(),
        Chat.routeName :(_)=> Chat()
      },
      initialRoute: Splash.routeName,
    );
  }
}

