import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/controller/homeController.dart';
import 'package:math_game/screens/widgets/bottom_area.dart';
import 'package:math_game/screens/widgets/game_over_view.dart';
import 'package:math_game/screens/widgets/score_area.dart';
import 'package:math_game/screens/widgets/view_area.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: Colors.black54),
        title: Text(
          "Math for FUN",
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        actions: [
          IconButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Update Player Information'),
                    content: Container(
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Player Name : "),
                          TextField(),
                          Padding(
                            padding: EdgeInsets.only(top: 18.0),
                            child: Text("Your Best Score : 200 "),
                          )
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
              icon: Icon(
                Icons.settings,
                color: Colors.black54,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(() => Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: homeController.start.value > 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [ScoreArea(), ViewArea(), BottomArea()],
                    )
                  : GameOverView(),
            )),
      ),
    );
  }
}
