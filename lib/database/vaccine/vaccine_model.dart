import 'package:intl/intl.dart';

var today = DateTime.now();
var yesterday = DateTime.now().subtract(Duration(days:1));
var dateFormat = DateFormat('M/dd/yy');

var date = dateFormat.format(yesterday).toString();

class VaccineJson {

  num administered;
  String country;

  VaccineJson({
    this.administered,
    this.country,

  });

  VaccineJson.fromJson(Map<String, dynamic> json){
    administered = json['timeline'][date];
    country = json['country'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['timeline'][date] = this.administered;
    data['country'] = this.country;

    return data;
  }
}