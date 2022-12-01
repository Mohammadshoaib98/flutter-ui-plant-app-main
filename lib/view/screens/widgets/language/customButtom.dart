import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  const CustomButton(
      {Key? key, required this.textButton, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 130,
      child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textColor: Colors.white,
        color: Constants.primaryColor,
        onPressed: onPressed,
        
        child: Text(
          textButton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
