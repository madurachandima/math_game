import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/controller/homeController.dart';

class ViewBestPlayers extends StatelessWidget {
  const ViewBestPlayers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find();
    return AlertDialog(
      title: Text('Update Player Information'),
      content: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: _homeController.bestPlayersList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Row(
                          children: [
                            Text(_homeController.bestPlayersList[index]
                                    ['playerName']
                                .toString())
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
