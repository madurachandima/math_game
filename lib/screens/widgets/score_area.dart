import 'package:flutter/material.dart';

class ScoreArea extends StatelessWidget {
  const ScoreArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                "Time : 10s",
                style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              Text("Score : 10", style: TextStyle(fontSize: 20))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Row(
            children: [Text("Your best Scored : 200 ")],
          ),
        ),
        Row(
          children: [Text("Best Scored by : "), Text("Player Name 600")],
        ),
      ],
    );
  }
}
