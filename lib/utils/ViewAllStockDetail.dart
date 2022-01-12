import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market/get/controller.dart';
import 'package:stock_market/graph/GraphData.dart';
import 'package:stock_market/screens/StockInfo.dart';
import 'package:stock_market/utils/constants.dart';

class ViewAllStockDetail extends StatefulWidget {
  final double height;
  final double width;
  final dynamic child;
  final String compName;
  final String value;
  final int param;

  ViewAllStockDetail(
      {Key? key,
      required this.height,
      required this.width,
      this.child,
      required this.compName,
      required this.value,
      required this.param})
      : super(key: key);

  @override
  State<ViewAllStockDetail> createState() => _ViewAllStockDetailState();
}

class _ViewAllStockDetailState extends State<ViewAllStockDetail> {
  var _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    ThemeData textTheme = Theme.of(context);
    double change = _controller.getposts[widget.param].change == '--'
        ? 0.0
        : double.parse(_controller.getposts[widget.param].change.toString());

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StockInfo(
                    param: widget.param,
                  ))),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: dark_blue),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Container(
                  height: 80,
                  width: 80,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Icon(
                      Icons.monetization_on,
                      color: white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.compName,
                    style: textTheme.textTheme.headline5?.copyWith(
                        color: light_blue.shade100, fontFamily: "BlackOpsOne"),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.value,
                        style: textTheme.textTheme.bodyText2?.copyWith(
                            color: white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              color: change < 0 ? red : green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            _controller.getposts[widget.param].change,
                            style: textTheme.textTheme.bodyText2?.copyWith(
                                color: white, fontWeight: FontWeight.bold),
                          )))
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: GraphData(
                  param: widget.param,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
