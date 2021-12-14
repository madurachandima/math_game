import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/config/color_config.dart';
import 'package:math_game/const/assetsPath.dart';
import 'package:math_game/screens/firstScreen/Controller/firstscreenController.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _firstScreenController = Get.put(FirstScreenController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 300,
                child: Image.asset(
                  loginImage,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: Text(
                  "Welcome to Math for FUN ",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 30,
                ),
                child: TextFormField(
                  controller: _firstScreenController.userNameController,
                  autofocus: false,
                  style:
                      const TextStyle(fontSize: 14.0, color: Color(0xFFbdc6cf)),
                  cursorColor: ColorConfig.appDefaultYellow,
                  decoration: InputDecoration(
                    hintText: "Enter Player Name",
                    fillColor: Colors.transparent,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    contentPadding:
                        const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(
                            color: ColorConfig.appDefaultYellow)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide:
                          const BorderSide(color: ColorConfig.appDefaultYellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(color: ColorConfig.appRed),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(color: ColorConfig.appRed),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                //sign in button
                child: ElevatedButton(
                    onPressed: () async {
                      //check is button already pressed if not call pressLoginButton function
                      _firstScreenController.isEnableSignUp.value
                          ? pressLoginButton()
                          // ignore: unnecessary_statements
                          : null;
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign up with google",
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 25,
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  pressLoginButton() async {
    var _firstScreenController = Get.put(FirstScreenController());
    //**Call login function */
    await _firstScreenController.login();
  }
}
