import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/screens/homeScreen/controller/homeController.dart';

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
              //set correct answer to text
              child: Text("Answer is : ${_controller.uiAnswer.value} "),
            )
          ],
        ),
      ),
      actions: <Widget>[
        //play again button
        TextButton(
          //play again button click event
          onPressed: () {
            // call calculate function and start timer function
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
