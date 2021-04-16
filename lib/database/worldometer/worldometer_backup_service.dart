import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

// Database
import 'package:covid19_information_center/database/worldometer/worldometer_model.dart';

class WorldometerBackupApiService {
  List<WorldometerJson> countriesList = [];

  Future<List<WorldometerJson>> getApiDataFromWorldometerJson() async {
    try {
      var res = await http.get(Uri.parse("https://disease.sh/v3/covid-19/countries?yesterday=true"));
      var jsonResponse = convert.jsonDecode(res.body);
      print('Backup Worldometer API Successfuly Loaded');
      var itemCount = jsonResponse;
      itemCount.forEach((e) {
        countriesList.add(WorldometerJson.fromJson(e));
      });
      return countriesList;
    } catch (e) {
      print('Error! API Failed to load $e');
      return e;
    }
  }
}