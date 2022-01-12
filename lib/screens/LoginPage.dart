import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market/get/authController.dart';
import 'package:stock_market/utils/button.dart';
import 'package:stock_market/utils/constants.dart';
import 'package:stock_market/screens/AccountPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _authController = Get.put(AuthController());

    Size size = MediaQuery.of(context).size;
    ThemeData textTheme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: size.height,
            width: size.width,
            color: black,
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Sign in",
                  style: textTheme.textTheme.headline1?.copyWith(
                    fontFamily: "BlackOpsOne",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: light_blue, width: 5)),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: light_blue,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Sign in to check all the latest stock values",
                  style: textTheme.textTheme.subtitle1
                      ?.copyWith(color: light_blue),
                ),
                SizedBox(
                  height: 10,
                ),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: TextFormField(
                    controller: mailController,
                    style: TextStyle(fontSize: 23, color: white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: white)),
                        labelText: "Enter your Email"),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: TextFormField(
                    controller: passswordController,
                    obscureText: !_showPassword,
                    style: TextStyle(fontSize: 23, color: white),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: white),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: white)),
                      labelText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: white,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ButtonCustom(
                    width: size.width * 0.6,
                    height: 60,
                    text: "Sign in",
                    theme: textTheme.textTheme.headline3,
                    color: light_blue,
                    onTap: () {
                      _authController.login(
                          mailController.text, passswordController.text);
                    }),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountPage()));
                    },
                    child: Text("Create new account!",
                        style: TextStyle(color: light_blue, fontSize: 18)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
