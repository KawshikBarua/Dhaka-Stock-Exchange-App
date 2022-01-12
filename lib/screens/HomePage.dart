import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market/database/database.dart';
import 'package:stock_market/get/DataController.dart';
import 'package:stock_market/get/controller.dart';
import 'package:stock_market/utils/StockDetail.dart';
import 'package:stock_market/utils/constants.dart';
import 'package:stock_market/utils/CompanyInfoContainer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var controller = Get.put(Controller());
  var dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData textTheme = Theme.of(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Obx(() {
          return Container(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(200),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        color: black,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        //First and Last Name will be fetched here
                                        "${dataController.userData['First Name']}${dataController.userData['Last Name']}",
                                        style: textTheme.textTheme.headline1
                                            ?.copyWith(color: black),
                                      ),
                                      Text(
                                        //Username will be fetched here
                                        "@${dataController.userData["Username"]}",
                                        style: textTheme.textTheme.bodyText1
                                            ?.copyWith(color: black),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 110,
                        width: size.width,
                        child: Obx(() => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.getposts.length,
                            itemBuilder: (context, item) {
                              return CompanyInfo(
                                height: 120,
                                width: 220,
                                compName: controller.getposts[item].tradingCode,
                                value: controller.getposts[item].value,
                                param: item,
                              );
                            })),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Text(
                          "Watch List",
                          style: textTheme.textTheme.headline4
                              ?.copyWith(color: black),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: controller.postloading.value
                            ? Center(child: CircularProgressIndicator())
                            : StreamBuilder(
                                stream: Database().fetchStockDataFromFirebase(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                        child: Text(
                                      "Nothing added to the watch list yet",
                                    ));
                                  } else {
                                    return ListView.builder(
                                        itemCount: snapshot.data.docs.length,
                                        itemBuilder: (context, item) =>
                                            StockDetail(
                                              height: 100,
                                              width: size.width * 0.9,
                                              ticker: controller
                                                  .getposts[snapshot
                                                      .data.docs[item]['Data']]
                                                  .tradingCode,
                                              value: controller
                                                  .getposts[snapshot
                                                      .data.docs[item]['Data']]
                                                  .value,
                                              param: snapshot.data.docs[item]
                                                  ['Data'],
                                            ));
                                  }
                                },
                              ),
                      )
                    ],
                  ),
                ],
              ));
        }),
      ),
    );
  }
}
