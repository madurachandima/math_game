import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/controller/homeController.dart';
import 'package:math_game/screens/widgets/bottom_area.dart';
import 'package:math_game/screens/widgets/score_area.dart';
import 'package:math_game/screens/widgets/view_area.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeVontroller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Math for FUN"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Update Player Information'),
                    content: Container(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Player Name : "),
                          TextField(),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Update'),
                        child: const Text('Update'),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ScoreArea(), ViewArea(), BottomArea()],
          ),
        ),
      ),
    );
  }
}
