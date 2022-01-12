//import 'dart:async';
import 'package:get/get.dart';
import 'package:stock_market/model/Data.dart';
import 'package:stock_market/get/service.dart';

class Controller extends GetxController {
  var getposts = <Data>[].obs;

  Services services = Services();
  var postloading = true.obs;

  @override
  void onInit() {
    callpostmethod();
    // Timer.periodic(Duration(minutes: 5), (timer) {
    //   print("Api is getting called.");
    //   callpostmethod();
    // });
    super.onInit();
  }

  callpostmethod() async {
    try {
      postloading.value = true;
      var result = await services.getallposts();
      if (result != null) {
        getposts.assignAll(result);
      } else {
        print("null");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }
}
