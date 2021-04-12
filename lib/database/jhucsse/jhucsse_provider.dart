import 'package:covid19_information_center/database/jhucsse/jhucsse_model.dart';
import 'package:flutter/material.dart';

// Database
import 'package:covid19_information_center/database/jhucsse/jhucsse_service.dart';

class FetchJhucsseDataProvider with ChangeNotifier {
  List<JhucsseJson> historical = [];
  bool loading = false;
  JhucsseApiService jhucsseApiService = JhucsseApiService();

  int index = 0;

  FetchJhucsseDataProvider() {
    initialize();
    print('JHUCSSE: Data Provided');
  }

  Future<void> initialize() async {
    print('JHUCSSE: Initialized');

    await getJhucsseDataFromInternet();
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

  getJhucsseDataFromInternet() async {
    print('JHUCSSE: Data Retrieved');

    loading = true;
    historical = await jhucsseApiService.getApiDataFromJhucsseJson();
    loading = false;
    notifyListeners();
  }
}