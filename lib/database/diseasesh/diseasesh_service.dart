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
      print('--API SUCCESS ');
      var itemCount = jsonResponse;
      itemCount.forEach((e) {
        randomJsonList.add(RandomJson.fromJson(e));
      });
      return randomJsonList;
    } catch (e) {
      print('Error while calling api $e');
      return e;
    }
  }
}

/*
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:covid19_information_center/database/diseasesh_model.dart';

import 'package:provider/provider.dart';

class HttpService {
  final String postsURL = "https://disease.sh/v3/covid-19/countries";

  Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}

 */
