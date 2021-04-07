import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:covid19_information_center/database/case_data.dart';

final databaseReference = FirebaseDatabase.instance.reference();

Future<List<Case>> fetchFirebase() async{
  DataSnapshot dataSnapshot = await databaseReference.child('sheets').child("Daily").once();
  List<Case> cases = [];

  return cases;
}