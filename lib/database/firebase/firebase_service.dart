import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:covid19_information_center/database/firebase/firebase_model.dart';
import 'package:covid19_information_center/database/firebase/firebase_service.dart';
import 'package:covid19_information_center/database/firebase/firebase_provider.dart';


/*
class Database {

  static Future<Query> queryMountains() async {
    return FirebaseDatabase.instance
        .reference()
        .child("sheets")
        .child("cases");
  }
}

 */


import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

// Database
import 'package:covid19_information_center/database/jhucsse/jhucsse_model.dart';

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
