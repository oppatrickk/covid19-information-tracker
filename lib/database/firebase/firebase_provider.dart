import 'package:flutter/material.dart';

// Database
import 'package:covid19_information_center/database/firebase/firebase_model.dart';
import 'package:covid19_information_center/database/firebase/firebase_service.dart';

class FetchFirebaseDataProvider with ChangeNotifier {
  List<FirebaseJson> bicol = [];
  bool loading = false;
  FirebaseApiService firebaseApiService = FirebaseApiService();

  int index = 0;

  FetchFirebaseDataProvider() {
    initialize();
    print('Firebase: Data Provided');
  }

  Future<void> initialize() async {
    print('Firebase: Initialized');

    await getFirebaseDataFromInternet();
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

  getFirebaseDataFromInternet() async {
    print('JHUCSSE: Data Retrieved');

    loading = true;
    bicol = await firebaseApiService.getApiDataFromFirebaseJson();
    loading = false;
    notifyListeners();
  }
}