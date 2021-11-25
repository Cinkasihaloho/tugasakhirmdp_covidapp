import 'package:flutter/cupertino.dart';
import 'package:covidapp/models/country_model.dart';
import 'package:covidapp/services/country_service.dart';

class CountryProvider with ChangeNotifier {
  List<Country> _countries = [];
  List<Country> get countries => _countries;
  set countries(List<Country> countries) {
    _countries = countries;
    notifyListeners();
  }

  Future<List<Country>> getCountry() async {
    try {
      List<Country> countries = await CountryService().getCountry();
      _countries = countries;
      return countries;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
