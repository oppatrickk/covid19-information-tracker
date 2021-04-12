import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

// Database
import 'package:covid19_information_center/database/jhucsse/jhucsse_model.dart';

class JhucsseApiService {
  List<JhucsseJson> jhucsseJsonList = [];

  Future<List<JhucsseJson>> getApiDataFromJhucsseJson() async {
    try {
      var res = await http.get(Uri.parse("https://disease.sh/v3/covid-19/historical?lastdays=7"));
      var jsonResponse = convert.jsonDecode(res.body);
      print('JHUCSSE API Successfully Loaded ');
      var itemCount = jsonResponse;
      itemCount.forEach((e) {
        jhucsseJsonList.add(JhucsseJson.fromJson(e));
      });
      return jhucsseJsonList;
    } catch (e) {
      print('Error! API Failed to load $e');
      return e;
    }
  }
}
