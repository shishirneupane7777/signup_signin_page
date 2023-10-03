import 'package:flutter/material.dart';
import '../screen/app_utils.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText=false,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 30),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText,
        controller: controller,
        textAlign: TextAlign.center,
        style:const TextStyle(
          color: colorWhite,
        ),
        cursorColor: colorWhite,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(
            icon,
            color: colorWhite,
            size:25),
            focusColor: colorWhite,
            hintText: hintText,
            hintStyle:const TextStyle(
              color: colorGrey,
              fontSize: 12,
            ),
            focusedBorder:const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite),
            ),
            border:const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite)
              ),
              contentPadding: const EdgeInsets.only(top: 15.0),
        ),
      ),
    );
  }
}