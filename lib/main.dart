import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stock_market/bindings/bind.dart';
import 'package:stock_market/screens/isSignedIn.dart';
import 'package:stock_market/utils/constants.dart';
import 'dart:ui';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = window.physicalSize.width;
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: white,
          textTheme: size > 500 ? TEXT_THEME_LARGE : TEXT_THEME_SMALL,
          fontFamily: 'JoseFinSans'),
      home: Scaffold(
        body: IsSignedIn(),
      ),
    );
  }
}
