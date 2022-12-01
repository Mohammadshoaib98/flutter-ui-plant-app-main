
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/view/screens/widget/auth/custombuttonauth.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.backgroundColor,
        elevation: 0.0,
        title: Text('Success',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Constants.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: Constants.primaryColor,
          )),
          Text("congratulations",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontSize: 35)),
                  const SizedBox(height: 25),
        const Text("Password has been reset successfully"),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomBottomAuth(
                text: "Go To Login",
                onPressed: () {
                    Get.offAllNamed(AppRoutes.signIn);
//go to login page 
                }),
          ),
        ]),
      ),
    );
  }
}