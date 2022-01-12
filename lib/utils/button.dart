import 'package:flutter/material.dart';
import 'package:stock_market/utils/constants.dart';

class ButtonCustom extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final TextStyle? theme;
  final Color color;
  final dynamic Function() onTap;
  const ButtonCustom(
      {Key? key,
      required this.width,
      required this.height,
      required this.text,
      required this.theme,
      required this.color,
      required this.onTap})
      : super(key: key);

  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: color,
      splashColor: teal,
      elevation: 4,
      child: Container(
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style: theme,
          ),
        ),
      ),
    );
  }
}
