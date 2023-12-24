import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function()? onPressed;
  String text;
  CustomButton({required this.onPressed,required this.text});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20),)),
    );
  }
}
