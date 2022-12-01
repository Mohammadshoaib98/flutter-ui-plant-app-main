import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitleAuth({Key? key, 
  required this.text}) :
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      
      text,
      textAlign: TextAlign.center,
      style:TextStyle(color: Constants.primaryColor,fontSize: 40,fontWeight: FontWeight.bold),
      
    );
  }
}