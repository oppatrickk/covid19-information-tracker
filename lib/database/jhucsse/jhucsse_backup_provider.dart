import 'package:covid19_information_center/database/jhucsse/jhucsse_backup_model.dart';
import 'package:flutter/material.dart';

// Database
import 'package:covid19_information_center/database/jhucsse/jhucsse_backup_service.dart';

class FetchJhucsseBackupDataProvider with ChangeNotifier {
  List<JhucsseJson> historical = [];
  bool loading = false;
  JhucsseBackupApiService jhucsseBackupApiService = JhucsseBackupApiService();

  int index = 0;

  FetchJhucsseBackupDataProvider() {
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
    historical = await jhucsseBackupApiService.getApiDataFromJhucsseJson();
    loading = false;
    notifyListeners();
  }
}