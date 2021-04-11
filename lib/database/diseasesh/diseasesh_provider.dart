import 'package:flutter/material.dart';

// Database
import 'package:covid19_information_center/database/initialize_data.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_service.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_model.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_provider.dart';

class FetchDataProvider with ChangeNotifier {
  List<RandomJson> randomJson = List();
  bool loading = false;
  ApiService apiService = ApiService();

  int index = 0;

  FetchDataProvider() {
    initialize();
    print('Loading: 75%');
  }

  Future<void> initialize() async {
    print('Loading: 25%');

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
    print('Loading: 50%');

    loading = true;
    randomJson = await apiService.getApiDataFromRandomJson();
    loading = false;
    notifyListeners();
  }
}