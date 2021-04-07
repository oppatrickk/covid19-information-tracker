import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

class DiseaseShData extends StatefulWidget {

  @override
  _DiseaseShDataState createState() => _DiseaseShDataState();
}

class _DiseaseShDataState extends State<DiseaseShData> {
  List philippineData;


  fetchPhilippineData() async {
    http.Response response =
    await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));

    setState(() {
      philippineData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchPhilippineData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  }
}