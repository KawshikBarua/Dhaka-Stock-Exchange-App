import 'package:get/get.dart';
import 'package:stock_market/get/DataController.dart';
import 'package:stock_market/get/authController.dart';
import 'package:stock_market/get/controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => DataController());
    Get.lazyPut(() => Controller());
  }
}
