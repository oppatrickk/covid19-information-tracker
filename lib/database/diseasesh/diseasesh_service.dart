import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

// Database
import 'package:covid19_information_center/database/diseasesh/diseasesh_provider.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_model.dart';
import 'package:covid19_information_center/database/diseasesh/diseasesh_service.dart';


class ApiService {
  List<RandomJson> randomJsonList = [];

  Future<List<RandomJson>> getApiDataFromRandomJson() async {
    try {
      var res = await http.get(Uri.parse("https://disease.sh/v3/covid-19/countries"));
      var jsonResponse = convert.jsonDecode(res.body);
      print('API Successfully Loaded ');
      var itemCount = jsonResponse;
      itemCount.forEach((e) {
        randomJsonList.add(RandomJson.fromJson(e));
      });
      return randomJsonList;
    } catch (e) {
      print('Error! API Failed to load $e');
      return e;
    }
  }
}