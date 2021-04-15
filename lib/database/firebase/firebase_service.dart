import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// Database
import 'package:covid19_information_center/database/firebase/firebase_model.dart';

class FirebaseApiService {
  List<FirebaseJson> firebaseJsonList = [];

  Future<List<FirebaseJson>> getApiDataFromFirebaseJson() async {
    try {
      var res = await http.get(Uri.parse("https://covid-19-information-tracker-default-rtdb.firebaseio.com/sheets/cases.json"));
      var jsonResponse = convert.jsonDecode(res.body);
      print('Firebase API Successfully Loaded ');
      var itemCount = jsonResponse;
      itemCount.forEach((e) {
        firebaseJsonList.add(FirebaseJson.fromJson(e));
      });
      return firebaseJsonList;
    } catch (e) {
      print('Error! API Failed to load $e');
      return e;
    }
  }
}
