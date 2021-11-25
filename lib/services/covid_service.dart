import 'dart:convert';

import 'package:covidapp/models/covid_model.dart';
import 'package:http/http.dart' as http;
import 'package:covidapp/models/country_model.dart';

class CovidService {
  String baseUrl = 'https://covid-api.mmediagroup.fr/v1/cases';

  Future<Covid> getCovid(String country) async {
    var url = Uri.parse(baseUrl);
    var headers = {'Content-Type': 'application/json'};
    var params = {
      'country': country,
    };
    final newUrl = url.replace(queryParameters: params);
    var response = await http.get(newUrl, headers: headers);

    if (response.statusCode == 200) {
      Covid covid = Covid.fromJson(jsonDecode(response.body)["All"]);

      print("Success");
      return covid;
    } else {
      throw Exception('Failed getting covids');
    }
  }
}
