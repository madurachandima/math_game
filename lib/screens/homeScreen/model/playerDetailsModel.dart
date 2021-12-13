import 'dart:convert';

PlayerDetailsModel playerDetailsModelFromJson(String str) =>
    PlayerDetailsModel.fromJson(json.decode(str));

String playerDetailsModelToJson(PlayerDetailsModel data) =>
    json.encode(data.toJson());

class PlayerDetailsModel {
  PlayerDetailsModel({
    this.id,
    this.authId,
    this.playerId,
    this.playerName,
    this.playerScore,
    this.date,
    this.v,
  });

  String? id;
  String? authId;
  String? playerId;
  String? playerName;
  int? playerScore;
  DateTime? date;
  int? v;

  factory PlayerDetailsModel.fromJson(Map<String, dynamic> json) =>
      PlayerDetailsModel(
        id: json["_id"],
        authId: json["auth_id"],
        playerId: json["playerId"],
        playerName: json["playerName"],
        playerScore: json["playerScore"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "auth_id": authId,
        "playerId": playerId,
        "playerName": playerName,
        "playerScore": playerScore,
        "date": date!.toIso8601String(),
        "__v": v,
      };
}
