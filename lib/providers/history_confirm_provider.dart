import 'package:covidapp/models/covid_model.dart';
import 'package:covidapp/models/history_confirm_model.dart';
import 'package:covidapp/services/covid_service.dart';
import 'package:covidapp/services/history_confirm_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:covidapp/models/country_model.dart';
import 'package:covidapp/services/country_service.dart';

class ConfirmedProvider with ChangeNotifier {
  late Confirmed _covids;
  Confirmed get covids => _covids;
  set covids(Confirmed covids) {
    _covids = covids;
    notifyListeners();
  }

  Future<Confirmed> getConfirmed(String country) async {
    try {
      Confirmed covids = await ConfirmedService().getConfirmed(country);
      _covids = covids;
      return covids;
    } catch (e) {
      print(e);
      Map<String, int> data = {
        "2021-11-24": 10,
      };

      return Confirmed(country: "", dates: data);
    }
  }
}
