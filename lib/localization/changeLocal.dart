import 'package:flutter/material.dart';
import 'package:flutter_onboarding/controller/localeController.dart';
import 'package:flutter_onboarding/view/screens/widgets/language/customButtom.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.headline5,
            ),
             const SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {
               //this ready when i saved this in sharedPreference 
                //controller.changeLang("ar");
              },
              textButton: "2".tr,
            ),
            CustomButton(
              onPressed: () {
                //controller.changeLang("en");
              },
              textButton: "3".tr,
            ),
          
          ],
        ),
      ),
    );
  }
}
