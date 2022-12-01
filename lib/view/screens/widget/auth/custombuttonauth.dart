import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class CustomBottomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomBottomAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding:const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: Constants.primaryColor,
        textColor: Colors.white,
        child: Text(text , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 16)),
      ),
    );
  }
}
