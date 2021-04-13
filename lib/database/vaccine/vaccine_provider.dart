import 'package:flutter/material.dart';

// Database
import 'package:covid19_information_center/database/vaccine/vaccine_service.dart';
import 'package:covid19_information_center/database/vaccine/vaccine_model.dart';

class FetchVaccineDataProvider with ChangeNotifier{
  List<VaccineJson> vaccine = [];
  bool loading = false;
  VaccineApiService vaccineApiService = VaccineApiService();

  int index = 0;

  FetchVaccineDataProvider() {
    initialize();
    print('Vaccine: Data Provided');
  }

  Future<void> initialize() async {
    print('Vaccine: Initialized');

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
    print('Vaccine: Data Retrieved');

    loading = true;
    vaccine = await vaccineApiService.getApiDataFromVaccineJson();
    loading = false;
    notifyListeners();
  }

}