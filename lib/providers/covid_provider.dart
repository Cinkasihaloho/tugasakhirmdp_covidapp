import 'package:covidapp/models/covid_model.dart';
import 'package:covidapp/services/covid_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:covidapp/models/country_model.dart';
import 'package:covidapp/services/country_service.dart';

class CovidProvider with ChangeNotifier {
  late Covid _covids;
  Covid get covids => _covids;
  set covids(Covid covids) {
    _covids = covids;
    notifyListeners();
  }

  Future<Covid> getCovid(String country) async {
    try {
      Covid covids = await CovidService().getCovid(country);
      _covids = covids;
      return covids;
    } catch (e) {
      print(e);
      return Covid(
        confirmed: 0,
        recovered: 0,
        deaths: 0,
        country: "",
      );
    }
  }
}
