import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market/get/controller.dart';
import 'package:stock_market/utils/constants.dart';
import 'package:stock_market/utils/ViewAllStockDetail.dart';

class ViewAllPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ViewAllPageState();
}

class ViewAllPageState extends State<ViewAllPage> {
  var _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData textTheme = Theme.of(context);
    return SafeArea(
        child: Obx(
      () => _controller.postloading.value
          ? Center(child: CircularProgressIndicator())
          : Align(
              alignment: Alignment.center,
              child: Container(
                height: size.height,
                width: size.width * 0.95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 30),
                      child: Text(
                        "View All Stocks",
                        style: textTheme.textTheme.headline2
                            ?.copyWith(color: black),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: _controller.getposts.length,
                        itemBuilder: (context, item) {
                          return ViewAllStockDetail(
                            height: 100,
                            width: size.width,
                            compName: _controller.getposts[item].tradingCode,
                            value: _controller.getposts[item].value,
                            param: item,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    ));
  }
}
