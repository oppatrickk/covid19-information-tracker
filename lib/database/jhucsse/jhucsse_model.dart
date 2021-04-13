import 'package:intl/intl.dart';

var item1 = DateTime.now().subtract(Duration(days:6));
var item2 = DateTime.now().subtract(Duration(days:5));
var item3 = DateTime.now().subtract(Duration(days:4));
var item4 = DateTime.now().subtract(Duration(days:3));
var item5 = DateTime.now().subtract(Duration(days:2));
var item6 = DateTime.now().subtract(Duration(days:1));

var dateFormat = DateFormat('M/d/yy');

var date1 = dateFormat.format(item1).toString();
var date2 = dateFormat.format(item2).toString();
var date3 = dateFormat.format(item3).toString();
var date4 = dateFormat.format(item4).toString();
var date5 = dateFormat.format(item5).toString();
var date6 = dateFormat.format(item6).toString();

class JhucsseJson {

  num day1;
  num day2;
  num day3;
  num day4;
  num day5;
  num day6;

  String country;

  JhucsseJson({
    this.day1,
    this.day2,
    this.day3,
    this.day4,
    this.day5,
    this.day6,

    this.country,

});

  JhucsseJson.fromJson(Map<String, dynamic> json) {
    day1 = json['timeline']['cases'][date1];
    day2 = json['timeline']['cases'][date2];
    day3 = json['timeline']['cases'][date3];
    day4 = json['timeline']['cases'][date4];
    day5 = json['timeline']['cases'][date5];
    day6 = json['timeline']['cases'][date6];

    country = json['country'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic> ();

    data['timeline']['cases'][date1] = this.day1;
    data['timeline']['cases'][date2] = this.day2;
    data['timeline']['cases'][date3] = this.day3;
    data['timeline']['cases'][date4] = this.day4;
    data['timeline']['cases'][date5] = this.day5;
    data['timeline']['cases'][date6] = this.day6;

    data['country'] = this.country;

    return data;
  }
}