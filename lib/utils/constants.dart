import 'package:flutter/material.dart';

const black = Color.fromRGBO(0, 0, 0, 1);
const light_blue = Colors.lightBlue;
const teal = Color.fromRGBO(113, 223, 231, 1);
const dark_blue = Color.fromRGBO(24, 29, 49, 1);
const green = Colors.green;
const red = Colors.red;
const white = Colors.white;
const grey = Color.fromRGBO(128, 128, 128, 1);
const brown = Colors.brown;
const tranparant = Color.fromRGBO(0, 0, 0, 0.5);

const TEXT_THEME_LARGE = TextTheme(
  headline1: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 28),
  headline2: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.w700),
  headline3: TextStyle(color: white, fontSize: 23, fontWeight: FontWeight.w700),
  headline4: TextStyle(color: white, fontSize: 21, fontWeight: FontWeight.w700),
  headline5: TextStyle(color: white, fontSize: 19, fontWeight: FontWeight.w700),
  headline6: TextStyle(color: white, fontSize: 17, fontWeight: FontWeight.w700),
  bodyText1: TextStyle(color: white, fontSize: 17, fontWeight: FontWeight.w500),
  bodyText2: TextStyle(
      color: black, fontSize: 16, fontWeight: FontWeight.w500, height: 1.5),
  subtitle1: TextStyle(color: white, fontSize: 13, fontWeight: FontWeight.w400),
  subtitle2: TextStyle(color: white, fontSize: 13, fontWeight: FontWeight.w400),
);

const TEXT_THEME_SMALL = TextTheme(
  headline1: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 24),
  headline2: TextStyle(color: white, fontSize: 22, fontWeight: FontWeight.w700),
  headline3: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w700),
  headline4: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w700),
  headline5: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w700),
  headline6: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w700),
  bodyText1: TextStyle(color: white, fontSize: 13, fontWeight: FontWeight.w500),
  bodyText2: TextStyle(
      color: white, fontSize: 12, fontWeight: FontWeight.w500, height: 1.5),
  subtitle1: TextStyle(color: white, fontSize: 11, fontWeight: FontWeight.w400),
  subtitle2: TextStyle(color: white, fontSize: 11, fontWeight: FontWeight.w400),
);
