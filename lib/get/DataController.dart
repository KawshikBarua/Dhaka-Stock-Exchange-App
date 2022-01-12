import 'package:get/get.dart';
import 'package:stock_market/database/database.dart';

class DataController extends GetxController {
  var userData = {}.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {
    Database()
        .fetchUserDataFromFirebase()
        .then((value) => userData.assignAll(value.docs[0].data()));
  }
}
