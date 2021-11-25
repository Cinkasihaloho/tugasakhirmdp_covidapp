import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covidapp/models/country_model.dart';

class CountryService {
  String baseUrl =
      'https://my-json-server.typicode.com/cinkasihaloho/tugasakhirmdp_covidapp/country';

  Future<List<Country>> getCountry() async {
    var url = Uri.parse(baseUrl);
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<Country> countries = [];
      for (var item in data) {
        countries.add(Country.fromJson(item));
      }

      return countries;
    } else {
      throw Exception('Failed getting countries');
    }
  }
}
