import 'package:flutter/material.dart';

const Color colorWhite = Colors.white;
const Color colorPrimary = Color.fromARGB(255, 1, 63, 110);
const Color colorGrey = Colors.grey;

showScaffold(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ),);
}