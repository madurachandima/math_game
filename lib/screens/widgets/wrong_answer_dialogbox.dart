import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/controller/homeController.dart';

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
              child: Text("Answer is : ${_controller.answer.value} "),
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
            Navigator.pop(context, 'Ok');
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
