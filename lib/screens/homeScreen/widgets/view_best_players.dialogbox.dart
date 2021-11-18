import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/controller/homeController.dart';

class ViewBestPlayers extends StatelessWidget {
  const ViewBestPlayers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find();
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height - 400,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    color: Colors.red,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      size: 30,
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "View top five players",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: _homeController.bestPlayersList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Spacer(),
                            Text(
                              _homeController.bestPlayersList[index]
                                      ['playerName']
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Spacer(),
                            Text(
                                _homeController.bestPlayersList[index]
                                        ['country']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400)),
                            Spacer(),
                            Text(
                                _homeController.bestPlayersList[index]
                                        ['playerScore']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400)),
                            Spacer()
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
