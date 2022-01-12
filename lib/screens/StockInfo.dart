import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stock_market/database/database.dart';
import 'package:stock_market/get/controller.dart';
import 'package:stock_market/graph/GraphDataDetailed.dart';
import 'package:stock_market/utils/constants.dart';

class StockInfo extends StatefulWidget {
  final int param;

  const StockInfo({Key? key, required this.param}) : super(key: key);
  State<StatefulWidget> createState() => StockInfoState(param);
}

class StockInfoState extends State<StockInfo> {
  final int param;
  final List<int> added = [];
  var _controller = Get.put(Controller());

  StockInfoState(this.param);

  String dateTime() {
    DateTime dt = DateTime.now();
    String date = DateFormat.d().format(dt);
    String month = DateFormat.MMMM().format(dt);
    return date + " " + month;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData textTheme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 25,
                              color: dark_blue,
                            )),
                        Text(
                          _controller.getposts[param].tradingCode,
                          style: textTheme.textTheme.headline3?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: dark_blue,
                              fontFamily: "BlackOpsOne",
                              letterSpacing: 1.2),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: IconButton(
                        onPressed: () {
                          if (!added.contains(param)) {
                            Database().addStockDataToFirebase(param);
                            added.add(param);
                          }
                        },
                        icon: Icon(Icons.add_circle_sharp),
                        iconSize: 40,
                        color: dark_blue,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  dateTime(),
                  style: textTheme.textTheme.headline1?.copyWith(color: brown),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: size.height * 0.40,
                width: size.width,
                child: GraphDataDetailed(
                  param: param,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: dark_blue,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100)),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      children: [
                        "Value",
                        "High",
                        "Low",
                        "Change",
                        "LTP",
                        "Total Volume",
                        "Close Price",
                        "YCP",
                      ].map((e) {
                        String value = "";
                        switch (e) {
                          case "Value":
                            value = _controller.getposts[param].value;
                            break;
                          case "Change":
                            value = _controller.getposts[param].change;
                            break;
                          case "High":
                            value = _controller.getposts[param].high;
                            break;
                          case "Low":
                            value = _controller.getposts[param].low;
                            break;
                          case "Total Volume":
                            value = _controller.getposts[param].volume;
                            break;
                          case "LTP":
                            value = _controller.getposts[param].ltp;
                            break;
                          case "YCP":
                            value = _controller.getposts[param].ycp;
                            break;
                          case "Close Price":
                            value = _controller.getposts[param].closeP;
                            break;
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                e,
                                style: textTheme.textTheme.bodyText1?.copyWith(
                                    color: white, fontWeight: FontWeight.bold),
                              ),
                              Text(value,
                                  style: textTheme.textTheme.bodyText1
                                      ?.copyWith(
                                          color: white,
                                          fontWeight: FontWeight.bold))
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
