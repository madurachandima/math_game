import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:math_game/screens/homeScreen/controller/homeController.dart';
import 'package:math_game/screens/homeScreen/widgets/currect_answer_dialogbox.dart';
import 'package:math_game/screens/homeScreen/widgets/wrong_answer_dialogbox.dart';

class BottomArea extends StatelessWidget {
  const BottomArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contextHight = MediaQuery.of(context).size.height;
    var contextWidth = MediaQuery.of(context).size.width;
    HomeController _controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 18),
          child: Row(
            children: [
              //answer button
              Obx(() => ElevatedButton(
                  //answer button click event
                  onPressed: () {
                    /* call check answer function 
                    *@param numbers array element value
                    *return boolean
                    */
                    var isAnswerTrue =
                        _controller.checkAnswer(_controller.numbers[0]);
                    //check isAnswer true or false
                    if (isAnswerTrue) {
                      // call incrimrnt score function
                      _controller.incrimentScore();
                    } else {
                      //call decriment score function
                      _controller.decrimentScore();
                    }

                    showDialog<String>(
                      barrierDismissible: false,
                      context: context,
                      /* if isAnswer is True show correct answer 
                      *dialog box and if answer is false show wrong 
                      *answer dialog box
                      */
                      builder: (BuildContext context) => isAnswerTrue
                          ? CurrectAnswerDialogBox()
                          : WrongAnswerDialogBox(),
                    );
                    // stop count down timer
                    _controller.timer.cancel();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: contextWidth / 6,
                    height: contextHight / 10,

                    //set number array value to button text
                    child: Text(
                      _controller.numbers[0].toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                  ))),
              Spacer(),
              //answer button
              Obx(() => ElevatedButton(
                  //answer button click event
                  onPressed: () {
                    /* call check answer function 
                    *@param numbers array element value
                    *return boolean
                    */
                    var isAnswerTrue =
                        _controller.checkAnswer(_controller.numbers[1]);
                    //check isAnswer true or false
                    if (isAnswerTrue) {
                      // call incrimrnt score function
                      _controller.incrimentScore();
                    } else {
                      //call decriment score function
                      _controller.decrimentScore();
                    }

                    showDialog<String>(
                      barrierDismissible: false,
                      context: context,
                      /* if isAnswer is True show correct answer 
                      *dialog box and if answer is false show wrong 
                      *answer dialog box
                      */
                      builder: (BuildContext context) => isAnswerTrue
                          ? CurrectAnswerDialogBox()
                          : WrongAnswerDialogBox(),
                    );
                    // stop count down timer
                    _controller.timer.cancel();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: contextWidth / 6,
                    height: contextHight / 10,
                    child: Text(
                      //set number array value to button text
                      _controller.numbers[1].toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                  ))),
              Spacer(),
              //answer button

              Obx(() => ElevatedButton(
                    //answer button click event
                    onPressed: () {
                      /* call check answer function 
                    *@param numbers array element value
                    *return boolean
                    */
                      var isAnswerTrue =
                          _controller.checkAnswer(_controller.numbers[2]);
                      //check isAnswer true or false
                      if (isAnswerTrue) {
                        // call incrimrnt score function
                        _controller.incrimentScore();
                      } else {
                        //call decriment score function
                        _controller.decrimentScore();
                      }

                      showDialog<String>(
                        barrierDismissible: false,
                        context: context,
                        /* if isAnswer is True show correct answer 
                      *dialog box and if answer is false show wrong 
                      *answer dialog box
                      */
                        builder: (BuildContext context) => isAnswerTrue
                            ? CurrectAnswerDialogBox()
                            : WrongAnswerDialogBox(),
                      );
                      // stop count down timer
                      _controller.timer.cancel();
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: contextWidth / 6,
                        height: contextHight / 10,
                        child: Text(
                          //set number array value to button text
                          _controller.numbers[2].toString(),
                          style: TextStyle(fontSize: 30),
                        )),
                  ))
            ],
          ),
        ),
        Row(
          children: [
            //answer button

            Obx(() => ElevatedButton(
                  //answer button click event
                  onPressed: () {
                    /* call check answer function 
                    *@param numbers array element value
                    *return boolean
                    */
                    var isAnswerTrue =
                        _controller.checkAnswer(_controller.numbers[3]);
                    //check isAnswer true or false
                    if (isAnswerTrue) {
                      // call incrimrnt score function
                      _controller.incrimentScore();
                    } else {
                      //call decriment score function
                      _controller.decrimentScore();
                    }

                    showDialog<String>(
                      barrierDismissible: false,
                      context: context,
                      /* if isAnswer is True show correct answer 
                      *dialog box and if answer is false show wrong 
                      *answer dialog box
                      */
                      builder: (BuildContext context) => isAnswerTrue
                          ? CurrectAnswerDialogBox()
                          : WrongAnswerDialogBox(),
                    );
                    // stop count down timer
                    _controller.timer.cancel();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: contextWidth / 6,
                      height: contextHight / 10,
                      child: Text(
                        //set number array value to button text
                        _controller.numbers[3].toString(),
                        style: TextStyle(fontSize: 30),
                      )),
                )),
            Spacer(),
            //answer button
            Obx(() => ElevatedButton(
                //answer button click event
                onPressed: () {
                  /* call check answer function 
                    *@param numbers array element value
                    *return boolean
                    */
                  var isAnswerTrue =
                      _controller.checkAnswer(_controller.numbers[4]);
                  //check isAnswer true or false
                  if (isAnswerTrue) {
                    // call incrimrnt score function
                    _controller.incrimentScore();
                  } else {
                    //call decriment score function
                    _controller.decrimentScore();
                  }
                  showDialog<String>(
                    barrierDismissible: false,
                    context: context,
                    /* if isAnswer is True show correct answer 
                      *dialog box and if answer is false show wrong 
                      *answer dialog box
                      */
                    builder: (BuildContext context) => isAnswerTrue
                        ? CurrectAnswerDialogBox()
                        : WrongAnswerDialogBox(),
                  );
                  // stop count down timer
                  _controller.timer.cancel();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: contextWidth / 6,
                  height: contextHight / 10,
                  child: Text(
                    //set number array value to button text
                    _controller.numbers[4].toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                ))),
            Spacer(),
            //answer button
            Obx(() => ElevatedButton(
                  //answer button click event
                  onPressed: () {
                    /* call check answer function 
                    *@param numbers array element value
                    *return boolean
                    */
                    var isAnswerTrue =
                        _controller.checkAnswer(_controller.numbers[5]);
                    //check isAnswer true or false
                    if (isAnswerTrue) {
                      // call incrimrnt score function
                      _controller.incrimentScore();
                    } else {
                      //call decriment score function
                      _controller.decrimentScore();
                    }

                    showDialog<String>(
                      barrierDismissible: false,
                      context: context,

                      /* if isAnswer is True show correct answer 
                      *dialog box and if answer is false show wrong 
                      *answer dialog box
                      */
                      builder: (BuildContext context) => isAnswerTrue
                          ? CurrectAnswerDialogBox()
                          : WrongAnswerDialogBox(),
                    ); // stop count down timer
                    _controller.timer.cancel();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: contextWidth / 6,
                      height: contextHight / 10,
                      child: Text(
                        //set number array value to button text
                        _controller.numbers[5].toString(),
                        style: TextStyle(fontSize: 30),
                      )),
                ))
          ],
        ),
      ],
    );
  }
}
