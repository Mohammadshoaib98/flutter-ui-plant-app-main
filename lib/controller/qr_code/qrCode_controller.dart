import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:get/get.dart';

class QrController extends GetxController {
  late TextEditingController qrContentEditingController;
  var qrCode = ''.obs;
  var scannedQRcode;

  @override
  generateQR() {
    throw UnimplementedError();
  }

  @override
  readQR() {
    throw UnimplementedError();
  }

  @override
  void onInit() {
    qrContentEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    qrContentEditingController.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  showButtonSheet() {
    // TODO: implement showButtonSheet
    throw UnimplementedError();
  }

  Future<void> scanQR() async {
    try {
      if (scannedQRcode == -1) {
           Get.snackbar("Result", "QR Code" + "There is wrong ! ",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Constants.backgroundColor);
      } else {
        scannedQRcode = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR);
        Get.snackbar("Result", "QR Code" + scannedQRcode,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Constants.primaryColor,
            colorText: Constants.backgroundColor);
      }
    } on PlatformException {
      Get.snackbar("Result", "QR Code" + "There is wrong ! ",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Constants.backgroundColor);
    }
  }
}
