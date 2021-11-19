import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/config/color_config.dart';
import 'package:math_game/controller/homeController.dart';
import 'package:math_game/screens/homeScreen/widgets/bottom_area.dart';
import 'package:math_game/screens/homeScreen/widgets/game_over_view.dart';
import 'package:math_game/screens/homeScreen/widgets/score_area.dart';
import 'package:math_game/screens/homeScreen/widgets/view_area.dart';
import 'package:math_game/screens/homeScreen/widgets/view_best_players.dialogbox.dart';

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
          // style: TextStyle(color: ColorConfig.appTextGrey),
        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: ColorConfig.appBackgroundBalck,
        // foregroundColor: ColorConfig.appTextGrey,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () async {
                  homeController.isClickdBestPlayersButton
                      ? null
                      : pressBestPlayerButton(homeController, context);
                },
                icon: Icon(
                  Icons.people_alt_rounded,
                  // color: ColorConfig.appTextGrey,
                  size: 35,
                )),
          )
        ],
      ),
      // backgroundColor: ColorConfig.appBackgroundBalck,
      body: SingleChildScrollView(
        child: Obx(() => Container(
              // color: ColorConfig.appBackgroundBalck,
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

  pressBestPlayerButton(homeController, context) async {
    await homeController.getBestPlayers();
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => ViewBestPlayers(),
    );
  }
}
