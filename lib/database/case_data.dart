import 'package:firebase_database/firebase_database.dart';
import 'package:covid19_information_center/database/firebase_data.dart';
import 'dart:convert';

class Case {
  String body;
  String totalCase;


  Case(this.body, this.totalCase);

  Map<String, dynamic> toJson() {
    return {
  'totalCase': this.totalCase,
  'body': this.body,
  };
  }
}