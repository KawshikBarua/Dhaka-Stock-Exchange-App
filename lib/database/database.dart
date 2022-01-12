import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stock_market/screens/LoginPage.dart';
import 'package:stock_market/get/authController.dart';

class Database {
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("User");
  AuthController _auth = AuthController();

  void addStockDataToFirebase(int index) {
    Map<String, dynamic> dataIndex = {'Data': index};
    _collectionReference
        .doc(AuthController().getUserId)
        .collection('Stockindex')
        .add(dataIndex);
  }

  void addUserDataToFirebase(
      String first, String last, String user, String mail, String uid) {
    Map<String, dynamic> data = {
      "First Name": first,
      "Last Name": last,
      "Username": user,
      "Email": mail,
    };
    _collectionReference
        .doc(uid)
        .collection('UserInfo')
        .add(data)
        .then((value) => Get.offAll(LoginPage()));
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchUserDataFromFirebase() {
    var data =
        _collectionReference.doc(_auth.getUserId).collection('UserInfo').get();
    return data;
  }

  Stream<QuerySnapshot> fetchStockDataFromFirebase() async* {
    yield* _collectionReference
        .doc(_auth.getUserId)
        .collection('Stockindex')
        .snapshots();
  }
}
