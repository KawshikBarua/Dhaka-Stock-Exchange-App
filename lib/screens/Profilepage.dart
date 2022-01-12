import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market/get/DataController.dart';
import 'package:stock_market/get/authController.dart';
import 'package:stock_market/utils/constants.dart';
import 'package:stock_market/utils/button.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _dataController = Get.put(DataController());

    var _controller = AuthController();
    Size size = MediaQuery.of(context).size;
    ThemeData textTheme = Theme.of(context);
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.2,
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background.jpg')),
                    shape: BoxShape.circle),
              ),
              SizedBox(
                height: 15,
              ),
              //First and Last Name will be fetched here
              Text(
                  "${_dataController.userData['First Name']}${_dataController.userData['Last Name']}",
                  style: textTheme.textTheme.headline2
                      ?.copyWith(fontWeight: FontWeight.bold, color: black)),
              Text(
                //email Address will be fetched here
                "${_dataController.userData['Email']}",
                style: textTheme.textTheme.headline5?.copyWith(color: brown),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Text(
                  "Basic Information",
                  style: textTheme.textTheme.bodyText2
                      ?.copyWith(color: brown, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  "Name",
                  style: textTheme.textTheme.bodyText1
                      ?.copyWith(color: black, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: black,
                  ),
                  onPressed: () {},
                ),
              ),
              ListTile(
                title: Text(
                  "Password",
                  style: textTheme.textTheme.bodyText1
                      ?.copyWith(color: black, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios_rounded, color: black),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: ButtonCustom(
                    width: size.width * 0.40,
                    height: 50,
                    text: "Sign out",
                    theme: textTheme.textTheme.bodyText2?.copyWith(
                      color: white,
                    ),
                    color: dark_blue,
                    onTap: () {
                      _controller.signout();
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
