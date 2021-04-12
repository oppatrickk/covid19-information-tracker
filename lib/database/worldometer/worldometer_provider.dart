import 'package:flutter/material.dart';

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_service.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_model.dart';

class FetchWorldometerDataProvider with ChangeNotifier{
  List<WorldometerJson> countries = [];
  bool loading = false;
  WorldometerApiService worldometerApiService = WorldometerApiService();

  int index = 0;

  FetchWorldometerDataProvider() {
    initialize();
    print('Worldometer: Data Provided');
  }

  Future<void> initialize() async {
    print('Worldometer: Initialized');

    await getDataFromInternet();
  }

  increaseIndex() {
    index++;
    notifyListeners();
  }

  decreaseIndex() {
    index--;
    if (index.isNegative) {
      index = 0;
    }
    notifyListeners();
  }

  getDataFromInternet() async {
    print('Worldometer: Data Retrieved');

    loading = true;
    countries = await worldometerApiService.getApiDataFromWorldometerJson();
    loading = false;
    notifyListeners();
  }

}