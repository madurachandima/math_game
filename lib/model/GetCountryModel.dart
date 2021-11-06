import 'dart:convert';

GetCountryModel getCountryModelFromJson(String str) =>
    GetCountryModel.fromJson(json.decode(str));

String getCountryModelToJson(GetCountryModel data) =>
    json.encode(data.toJson());

class GetCountryModel {
  GetCountryModel({
    this.ip,
    this.location,
    this.welcomeAs,
    this.isp,
  });

  String? ip;
  Location? location;
  As? welcomeAs;
  String? isp;

  factory GetCountryModel.fromJson(Map<String, dynamic> json) =>
      GetCountryModel(
        ip: json["ip"],
        location: Location.fromJson(json["location"]),
        welcomeAs: As.fromJson(json["as"]),
        isp: json["isp"],
      );

  Map<String, dynamic> toJson() => {
        "ip": ip,
        "location": location!.toJson(),
        "as": welcomeAs!.toJson(),
        "isp": isp,
      };
}

class Location {
  Location({
    this.country,
    this.region,
    this.timezone,
  });

  String? country;
  String? region;
  String? timezone;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        country: json["country"],
        region: json["region"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "region": region,
        "timezone": timezone,
      };
}

class As {
  As({
    this.asn,
    this.name,
    this.route,
    this.domain,
    this.type,
  });

  int? asn;
  String? name;
  String? route;
  String? domain;
  String? type;

  factory As.fromJson(Map<String, dynamic> json) => As(
        asn: json["asn"],
        name: json["name"],
        route: json["route"],
        domain: json["domain"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "asn": asn,
        "name": name,
        "route": route,
        "domain": domain,
        "type": type,
      };
}
