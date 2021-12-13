import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/helper/Util.dart';
import 'package:math_game/screens/homeScreen/controller/homeController.dart';

class WrongAnswerDialogBox extends StatelessWidget {
  const WrongAnswerDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.find();
    return AlertDialog(
      title: Text('Wrong Answer'),
      content: Container(
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your answer is wrong "),
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text("Answer is : ${_controller.uiAnswer.value} "),
            )
          ],
        ),
      ),
      actions: <Widget>[
        // TextButton(
        //   onPressed: () => Navigator.pop(context, 'Cancel'),
        //   child: const Text('Cancel'),
        // ),
        TextButton(
          onPressed: () {
            _controller.calculate();
            _controller.startTimer();

            Navigator.pop(context, 'Play again');
          },
          child: const Text('Play again'),
        ),
      ],
    );
  }
}
