import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  final TextEditingController? myController;
  final Function valid;
  final Function onSave;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final String hintText;
  
  const CustomTextFormAuth({
    Key? key,
    this.obscureText,
    this.onTapIcon,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.myController,
    required this.valid,
    required this.isNumber, required this.onSave,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        onSaved: (onSave){},
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: (val){},
        controller: myController,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
            focusColor: Constants.primaryColor,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labelText)),
            prefixIcon: InkWell(
                onTap: onTapIcon,
                child: Icon(
                  iconData,
                  color: Constants.primaryColor,
                )),
            border: OutlineInputBorder(
                borderSide:const  BorderSide(
                  color: Constants.primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
