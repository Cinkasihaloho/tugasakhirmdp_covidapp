// To parse this JSON data, do
//
//     final confirmed = confirmedFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Confirmed {
  Confirmed({
    required this.country,
    required this.dates,
  });

  final String country;
  final Map<String, int> dates;

  factory Confirmed.fromRawJson(String str) =>
      Confirmed.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Confirmed.fromJson(Map<String, dynamic> json) => Confirmed(
        country: json["country"],
        dates:
            Map.from(json["dates"]).map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "dates": Map.from(dates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
