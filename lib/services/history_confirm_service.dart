import 'dart:convert';

import 'package:covidapp/models/history_confirm_model.dart';
import 'package:http/http.dart' as http;
import 'package:covidapp/models/country_model.dart';

class ConfirmedService {
  String baseUrl = 'https://covid-api.mmediagroup.fr/v1/history';

  Future<Confirmed> getConfirmed(String country) async {
    var url = Uri.parse(baseUrl);
    var headers = {'Content-Type': 'application/json'};
    var params = {'country': country, 'status': "confirmed"};
    final newUrl = url.replace(queryParameters: params);
    var response = await http.get(newUrl, headers: headers);

    if (response.statusCode == 200) {
      Confirmed confirmed =
          Confirmed.fromJson(jsonDecode(response.body)["All"]);

      print("Success");
      return confirmed;
    } else {
      throw Exception('Failed getting confirmeds');
    }
  }
}
