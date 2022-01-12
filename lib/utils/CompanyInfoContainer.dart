import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market/get/controller.dart';
import 'package:stock_market/graph/GraphData.dart';
import 'package:stock_market/utils/constants.dart';

class CompanyInfo extends StatelessWidget {
  final double height;
  final double width;
  final String compName;
  final String value;
  final int param;
  CompanyInfo(
      {Key? key,
      required this.height,
      required this.width,
      required this.compName,
      required this.value,
      required this.param})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(Controller());
    double change = _controller.getposts[param].change == '--'
        ? 0.0
        : double.parse(_controller.getposts[param].change);
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: grey),
              borderRadius: BorderRadius.circular(20),
              color: dark_blue),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      compName,
                      style: TextStyle(
                          color: light_blue.shade100,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              width: 140,
                              child: GraphData(param: param),
                            ))),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                        color: change < 0 ? red : green,
                        fontWeight: FontWeight.bold),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: _controller.getposts[param].change,
                        style: TextStyle(
                            color: change < 0 ? red : green,
                            fontWeight: FontWeight.bold)),
                    WidgetSpan(
                        child: Icon(
                      change < 0 ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: change < 0 ? red : green,
                    ))
                  ])),
                ],
              ),
            ],
          )),
    );
  }
}
