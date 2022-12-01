import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/view/screens/widgets/auth/customTextBodyAuth.dart';
import 'package:flutter_onboarding/view/screens/widgets/auth/customTextTitleAuth.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
//check from email 
class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Verification Code',
          style:TextStyle(fontSize: 20,color: Colors.black)),
        ),
      
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "Check code"),
          const SizedBox(height: 20),
          Column(
            children: [
          const Icon(Icons.mark_email_read_outlined,color: Constants.primaryColor,size: 100,),
              const SizedBox(height: 30,),
          const CustomTextBodyAuth(text:"Please Enter The Digit Code Sent To"),
          const SizedBox(height: 15),
          Text("mohammadShoaib@gmail.com",style: TextStyle(color: Colors.green.shade700),)
            ],
          ),
          const SizedBox(height: 20),
          OtpTextField(
            focusedBorderColor: Constants.primaryColor,
            cursorColor: Constants.primaryColor,
            fieldWidth: 50.0,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            borderColor:Constants.primaryColor,
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
            //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
             Get.offAndToNamed(AppRoutes.resetPassword);
            }, // end onSubmit
          ),
        
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
