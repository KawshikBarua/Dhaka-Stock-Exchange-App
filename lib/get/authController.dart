import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stock_market/database/database.dart';
import 'package:stock_market/screens/TabScreen.dart';
import 'package:stock_market/screens/welcomePage.dart';
import 'package:stock_market/utils/constants.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Rxn<User> _user = Rxn<User>();

  String? get user {
    return _user.value?.email;
  }

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  String get getUserId {
    return _firebaseAuth.currentUser!.uid;
  }

  void createUser(String firstName, String lastName, String username,
      String email, String password) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Database().addUserDataToFirebase(
            firstName, lastName, username, email, getUserId);
      });
    } catch (e) {
      Get.snackbar("Error has occured while Signing in", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: white);
    }
  }

  void login(String email, String password) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.offAll(TabScreen()));
    } catch (e) {
      Get.snackbar("Error has occured while creating account", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: white);
    }
  }

  void signout() async {
    try {
      await _firebaseAuth.signOut().then((value) => Get.offAll(WelcomePage()));
    } catch (e) {
      Get.snackbar("Error has occured while logging out", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: white);
    }
  }
}
