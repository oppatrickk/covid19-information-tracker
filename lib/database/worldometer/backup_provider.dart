import 'package:flutter/material.dart';

// Database
import 'package:covid19_information_center/database/worldometer/backup_service.dart';
import 'package:covid19_information_center/database/worldometer/worldometer_model.dart';


class FetchBackupDataProvider with ChangeNotifier{
  List<WorldometerJson> countries = [];
  bool loading = false;
  BackupApiService backupApiService = BackupApiService();

  int index = 0;

  FetchBackupDataProvider() {
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
    countries = await backupApiService.getApiDataFromWorldometerJson();
    loading = false;
    notifyListeners();
  }

}