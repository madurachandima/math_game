import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/config/color_config.dart';
import 'package:math_game/controller/homeController.dart';

class ViewBestPlayers extends StatelessWidget {
  const ViewBestPlayers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find();
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height - 250,
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
                "Top Five players",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                child: DataTable(
                    horizontalMargin: 0,
                    columnSpacing: MediaQuery.of(context).size.width / 30,
                    columns: [
                      DataColumn(
                          label: SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: const Text(
                          "Name",
                          style: TextStyle(color: ColorConfig.appTextGrey),
                          textAlign: TextAlign.start,
                        ),
                      )),
                      DataColumn(
                          label: SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: const Text(
                          "Country",
                          style: TextStyle(color: ColorConfig.appTextGrey),
                          textAlign: TextAlign.start,
                        ),
                      )),
                      DataColumn(
                          label: SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: const Text(
                          "Score",
                          style: TextStyle(color: ColorConfig.appTextGrey),
                          textAlign: TextAlign.start,
                        ),
                      ))
                    ],
                    rows: _homeController.bestPlayersList
                        .map((element) => DataRow(cells: [
                              DataCell(Text(
                                element['playerName'].toString().toUpperCase(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              )),
                              DataCell(Text(element['country'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400))),
                              DataCell(Text(element['playerScore'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)))
                            ]))
                        .toList()))
          ],
        ),
      ),
    );
  }
}
