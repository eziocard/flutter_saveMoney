import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String text;
  final IconData? icon;
  final TextEditingController? controller;
  final bool password;
  final int? maxLength;
  const TextFieldComponent({super.key,required this.text,this.icon, this.controller,this.password = false, this.maxLength,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      obscureText:password,
              decoration: InputDecoration(hintText:text,
              filled: true,                          // habilita el color de fondo
              fillColor: Colors.white, 
              prefixIcon: Icon(icon),
              border: OutlineInputBorder()));
  }
}