import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextEditingController controller;
  bool isPassword;
  String? Function(String?)? validator;
  TextInputType type;
  CustomTextField({required this.label,required this.controller,required this.isPassword,required this.type});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label,style: TextStyle(color: Colors.black),),
      ),
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      keyboardType: type,
    );
  }
}
