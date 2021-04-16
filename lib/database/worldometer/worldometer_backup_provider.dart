import 'package:flutter/material.dart';

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_backup_service.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_model.dart';


class FetchWorldometerBackupDataProvider with ChangeNotifier{
  List<WorldometerJson> countries = [];
  bool loading = false;
  WorldometerBackupApiService worldometerBackupApiService = WorldometerBackupApiService();

  int index = 0;

  FetchWorldometerBackupDataProvider() {
    initialize();
    print('Backup: Data Provided');
  }

  Future<void> initialize() async {
    print('Backup: Initialized');

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
    print('Backup: Data Retrieved');

    loading = true;
    countries = await worldometerBackupApiService.getApiDataFromWorldometerJson();
    loading = false;
    notifyListeners();
  }

}