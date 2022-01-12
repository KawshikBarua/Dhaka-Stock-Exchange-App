import 'package:flutter/material.dart';
import 'package:stock_market/utils/constants.dart';
import 'package:stock_market/screens/LoginPage.dart';
import 'package:stock_market/utils/button.dart';
import 'package:stock_market/screens/AccountPage.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData textTheme = Theme.of(context);

    return SafeArea(
        child: Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              child: Image.asset(
                'images/background.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              left: size.width * 0.025,
              bottom: 0,
              child: Container(
                height: size.height * 0.5,
                width: size.width * 0.95,
                decoration: BoxDecoration(
                  color: tranparant,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    children: [
                      Column(
                          children: [
                        "Invest,",
                        "Be Patient,",
                        "Look at the result!"
                      ]
                              .map(
                                (e) => Padding(
                                    padding: e.compareTo("Investment") == 0
                                        ? EdgeInsets.only(top: 20, left: 25)
                                        : EdgeInsets.symmetric(horizontal: 25),
                                    child: Container(
                                      width: size.width,
                                      child: Text(
                                        e,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                              )
                              .toList()),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonCustom(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              height: 60,
                              width: size.width * 0.3,
                              text: "Login",
                              theme: textTheme.textTheme.headline3,
                              color: light_blue,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ButtonCustom(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AccountPage()));
                              },
                              height: 60,
                              width: size.width * 0.3,
                              text: "Signup",
                              theme: textTheme.textTheme.headline3,
                              color: light_blue,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
