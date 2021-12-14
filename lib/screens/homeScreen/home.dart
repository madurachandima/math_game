import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/screens/homeScreen/apiRequest/api_request.dart';
import 'package:math_game/screens/homeScreen/controller/homeController.dart';

import 'package:math_game/screens/homeScreen/widgets/answer_buttons_area.dart';
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
        title: Text(
          "Math for FUN",
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            //app bar best players button
            child: IconButton(
                //app bar best players button click event
                onPressed: () async {
                  homeController.isClickdBestPlayersButton
                      // ignore: unnecessary_statements
                      ? null
                      : pressBestPlayerButton(context);
                },
                icon: Icon(
                  Icons.people_alt_rounded,
                  // color: ColorConfig.appTextGrey,
                  size: 35,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(() => Container(
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

  pressBestPlayerButton(context) async {
    await new ApiRequest().getBestPlayers();
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => ViewBestPlayers(),
    );
  }
}
