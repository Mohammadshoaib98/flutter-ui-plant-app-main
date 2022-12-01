import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/view/screens/widget/auth/custombuttonauth.dart';
import 'package:flutter_onboarding/view/screens/widget/auth/customtexttitleauth.dart';
import 'package:flutter_onboarding/view/screens/widgets/auth/customTextBodyAuth.dart';
import 'package:flutter_onboarding/view/screens/widgets/auth/customTextFormAuth.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text('ResetPassword',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.grey)),
        ),
        body: Container(
          color: Constants.backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            child: ListView(children: [
              const SizedBox(height: 20),
              const CustomTextTitleAuth(text: "New Password"),
              const SizedBox(height: 10),
              const CustomTextBodyAuth(text: "New Password"),
              const SizedBox(height: 15),
              CustomTextFormAuth(
                  onSave: (val) {},
                  isNumber: false,
                  iconData: Icons.lock_outline,
                  hintText: 'Enter Your Password',
                  labelText: 'Password',
                  myController: null,
                  valid: (String? val) {}
                  ),
              CustomTextFormAuth(
                onSave: (val) {},
                isNumber: false,
                iconData: Icons.lock_outline,
                hintText: "Re" + " " + "Enter Your Password",
                labelText: 'Password',
                myController: null,
                valid: (String? val) {},
              ),
              CustomBottomAuth(
                  text: "save",
                  onPressed: () {
                    Get.toNamed(AppRoutes.successResetPassword);
                    //go to success reset password
                  }),
              const SizedBox(height: 40),
            ]),
          ),
        ));
  }
}
