import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market/get/controller.dart';
import 'package:stock_market/graph/GraphData.dart';
import 'package:stock_market/screens/StockInfo.dart';
import 'package:stock_market/utils/constants.dart';

class StockDetail extends StatelessWidget {
  final double height;
  final double width;
  final dynamic child;
  final String ticker;
  final String value;
  final int param;
  const StockDetail(
      {Key? key,
      required this.height,
      required this.width,
      required this.ticker,
      required this.value,
      required this.param,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(Controller());
    double change = _controller.getposts[param].change == '--'
        ? 0.0
        : double.parse(_controller.getposts[param].change);
    ThemeData textTheme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StockInfo(
                    param: param,
                  ))),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: height,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 133,
                child: Text(
                  ticker,
                  style: textTheme.textTheme.headline6
                      ?.copyWith(color: black, fontFamily: "BlackOpsOne"),
                ),
              ),
              Column(children: [
                Text(
                  value,
                  style: textTheme.textTheme.headline5?.copyWith(color: black),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: change < 0 ? red : green,
                  elevation: 5,
                  child: Container(
                    height: 30,
                    width: 80,
                    child: Center(
                      child: Text(
                        _controller.getposts[param].change,
                        style: textTheme.textTheme.bodyText1,
                      ),
                    ),
                  ),
                )
              ]),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: GraphData(
                  param: param,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
