import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final double width;
  final TextFormField child;
  final Color color;

  TextFieldContainer(
      {Key? key, required this.width, required this.child, required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child:
          Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: child),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(14))),
    );
  }
}
