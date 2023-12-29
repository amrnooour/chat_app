import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextEditingController controller;
  bool isPassword;
  String? Function(String?)? validator;
  TextInputType type;
  String hint ;
  CustomTextField({required this.label,required this.controller,required this.isPassword,required this.type,required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        label: Text(label,style: TextStyle(color: Colors.black),),
      ),
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      keyboardType: type,
    );
  }
}
