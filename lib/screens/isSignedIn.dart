import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market/get/authController.dart';
import 'package:stock_market/screens/TabScreen.dart';
import 'package:stock_market/screens/welcomePage.dart';

class IsSignedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthController>().user == null
          ? WelcomePage()
          : TabScreen();
    });
  }
}
