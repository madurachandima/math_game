import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/controller/homeController.dart';

class CurrectAnswerDialogBox extends StatelessWidget {
  const CurrectAnswerDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.find();
    return AlertDialog(
      title: Text('Correct Answer'),
      content: Container(
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your answer is correct "),
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
            _controller.startTimer();

            Navigator.pop(context, 'Play again');
          },
          child: const Text('Play again'),
        ),
      ],
    );
  }
}
