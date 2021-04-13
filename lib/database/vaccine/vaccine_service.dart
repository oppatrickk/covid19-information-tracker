import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

// Database
import 'package:covid19_information_center/database/vaccine/vaccine_model.dart';

class VaccineApiService {
  List<VaccineJson> vaccineList = [];

  Future<List<VaccineJson>> getApiDataFromVaccineJson() async {
    try {
      var res = await http.get(Uri.parse("https://disease.sh/v3/covid-19/vaccine/coverage/countries?lastdays=30"));
      var jsonResponse = convert.jsonDecode(res.body);
      print('Vaccine API Successfuly Loaded');
      var itemCount = jsonResponse;
      itemCount.forEach((e) {
        vaccineList.add(VaccineJson.fromJson(e));
      });
      return vaccineList;
    } catch (e) {
      print('Error! API Failed to load $e');
      return e;
    }
  }
}