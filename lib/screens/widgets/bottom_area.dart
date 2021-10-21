import 'package:flutter/material.dart';

class BottomArea extends StatelessWidget {
  const BottomArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contextHight = MediaQuery.of(context).size.height;
    var contextWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 18),
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    // bool isInteger(num value) => (value % 1) == 0;
                    // print(isInteger(10.0));
                    // while (isInteger(10.2)) {
                    //   print("dsdsd");
                    // }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: contextWidth / 6,
                    height: contextHight / 10,
                    child: Text(
                      "20",
                      style: TextStyle(fontSize: 30),
                    ),
                  )),
              Spacer(),
              ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: contextWidth / 6,
                    height: contextHight / 10,
                    child: Text(
                      "20",
                      style: TextStyle(fontSize: 30),
                    ),
                  )),
              Spacer(),
              ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: contextWidth / 6,
                    height: contextHight / 10,
                    child: Text(
                      "20",
                      style: TextStyle(fontSize: 30),
                    ),
                  ))
            ],
          ),
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: contextWidth / 6,
                  height: contextHight / 10,
                  child: Text(
                    "20",
                    style: TextStyle(fontSize: 30),
                  ),
                )),
            Spacer(),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: contextWidth / 6,
                  height: contextHight / 10,
                  child: Text(
                    "20",
                    style: TextStyle(fontSize: 30),
                  ),
                )),
            Spacer(),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: contextWidth / 6,
                  height: contextHight / 10,
                  child: Text(
                    "20",
                    style: TextStyle(fontSize: 30),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
