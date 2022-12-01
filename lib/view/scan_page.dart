import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/controller/qr_code/qrCode_controller.dart';
import 'package:flutter_onboarding/view/screens/widget/auth/custombuttonauth.dart';
import 'package:flutter_onboarding/view/screens/widgets/language/customButtom.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanPage extends GetView<QrController> {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>QrController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child:  IconButton(
                   icon:const Icon( Icons.share),
                    color: Constants.primaryColor,
                    onPressed: () {
                      print("share");
                    },
                  ),
                ),
            ),

          )
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Constants.backgroundColor,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Obx(() => QrImage(
                    data: controller.qrCode.value,
                    size: 250,
                    foregroundColor: Colors.green.shade900,
                  )),
              const SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    onPressed: () {
                      controller.scanQR();
                    },
                    textButton: 'Scan QR',
                  ),
                  CustomButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),label:const Text("Enter Text"),suffixIcon: const Icon(Icons.qr_code,color:Constants.primaryColor),
                              ),
                              controller:  controller.qrContentEditingController,
                              onChanged: (val){
                                controller.qrCode.value=val;
                              },
                            ),
                            
                          ],
                        ),
                        backgroundColor: Constants.backgroundColor,
                        isScrollControlled: true,
                        elevation: 20.0,
                        shape:  RoundedRectangleBorder(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0))),
                      );
                    },
                    textButton: 'Generate QR',
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
