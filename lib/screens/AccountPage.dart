import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market/get/authController.dart';
import 'package:stock_market/utils/TextFieldContainer.dart';
import 'package:stock_market/utils/button.dart';
import 'package:stock_market/utils/constants.dart';

class AccountPage extends StatefulWidget {
  State<StatefulWidget> createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  final _formKey = GlobalKey<FormState>();

  var _controller = Get.put(AuthController());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passowordController = TextEditingController();
  final TextEditingController rePassowordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData textTheme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height,
              color: black,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.19,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(150)),
                            color: light_blue),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text("Registration Form",
                                  style: textTheme.textTheme.headline1)),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFieldContainer(
                            color: light_blue,
                            width: size.width * 0.4,
                            child: TextFormField(
                              validator: (v) => v!.isEmpty
                                  ? 'This Field cannot be empty'
                                  : null,
                              controller: firstNameController,
                              style: TextStyle(fontSize: 18, color: white),
                              decoration: InputDecoration(
                                  hintText: "First Name",
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          TextFieldContainer(
                            color: light_blue,
                            width: size.width * 0.4,
                            child: TextFormField(
                              validator: (v) => v!.isEmpty
                                  ? 'This Field cannot be empty'
                                  : null,
                              controller: lastNameController,
                              style: TextStyle(fontSize: 18, color: white),
                              decoration: InputDecoration(
                                  hintText: "Last Name",
                                  border: InputBorder.none),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFieldContainer(
                        color: light_blue,
                        width: size.width * 0.8,
                        child: TextFormField(
                          validator: (v) =>
                              v!.isEmpty ? 'This Field cannot be empty' : null,
                          controller: mailController,
                          style: TextStyle(fontSize: 18, color: white),
                          decoration: InputDecoration(
                              hintText: "Email Address",
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.mail,
                                color: white,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFieldContainer(
                        width: size.width * 0.8,
                        child: TextFormField(
                          validator: (v) =>
                              v!.isEmpty ? 'This Field cannot be empty' : null,
                          controller: usernameController,
                          style: TextStyle(fontSize: 18, color: white),
                          decoration: InputDecoration(
                              hintText: "Username",
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                                color: white,
                              )),
                        ),
                        color: light_blue,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFieldContainer(
                        width: size.width * 0.8,
                        child: TextFormField(
                          validator: (v) =>
                              v!.isEmpty ? 'This Field cannot be empty' : null,
                          controller: passowordController,
                          style: TextStyle(fontSize: 18, color: white),
                          decoration: InputDecoration(
                              hintText: "Password",
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                                color: white,
                              )),
                        ),
                        color: light_blue,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFieldContainer(
                        width: size.width * 0.8,
                        child: TextFormField(
                          validator: (v) =>
                              v!.isEmpty ? 'This Field cannot be empty' : null,
                          controller: rePassowordController,
                          style: TextStyle(fontSize: 18, color: white),
                          decoration: InputDecoration(
                              hintText: "Re-enter Password",
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                                color: white,
                              )),
                        ),
                        color: light_blue,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      ButtonCustom(
                          width: size.width * 0.8,
                          height: 50,
                          text: "Submit",
                          theme: textTheme.textTheme.headline5,
                          color: light_blue,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (passowordController.text ==
                                  rePassowordController.text) {
                                _controller.createUser(
                                    firstNameController.text,
                                    lastNameController.text,
                                    usernameController.text,
                                    mailController.text,
                                    passowordController.text);
                              } else {
                                Get.snackbar("Password did not match",
                                    "try re-rentering your password",
                                    backgroundColor: white);
                              }
                            }
                          }),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
