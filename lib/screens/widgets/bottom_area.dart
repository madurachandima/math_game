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
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('Answer is'),
                        content: Container(
                          height: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Your answer is wrong "),
                              Padding(
                                padding: EdgeInsets.only(top: 18.0),
                                child: Text("Correct answer is : 50 "),
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
                            onPressed: () => Navigator.pop(context, 'Ok'),
                            child: const Text('Ok'),
                          ),
                        ],
                      ),
                    );
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
                      "33",
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
                      "50",
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
                    "67",
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
                    "48",
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
                    "76",
                    style: TextStyle(fontSize: 30),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
