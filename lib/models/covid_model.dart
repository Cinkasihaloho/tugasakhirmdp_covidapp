// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Covid {
  Covid({
    required this.confirmed,
    required this.recovered,
    required this.deaths,
    required this.country,
  });

  final int confirmed;
  final int recovered;
  final int deaths;
  final String country;

  factory Covid.fromRawJson(String str) => Covid.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Covid.fromJson(Map<String, dynamic> json) => Covid(
        confirmed: json["confirmed"],
        recovered: json["recovered"],
        deaths: json["deaths"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "recovered": recovered,
        "deaths": deaths,
        "country": country,
      };
}
