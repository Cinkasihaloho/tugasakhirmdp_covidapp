// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Country {
  Country({
    required this.id,
    required this.name,
    required this.flag,
  });

  final int id;
  final String name;
  final String flag;

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "flag": flag,
      };
}
