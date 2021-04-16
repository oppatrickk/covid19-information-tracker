import 'package:intl/intl.dart';

var item1 = DateTime.now().subtract(Duration(days:1));
var item2 = DateTime.now().subtract(Duration(days:2));
var item3 = DateTime.now().subtract(Duration(days:3));
var item4 = DateTime.now().subtract(Duration(days:4));
var item5 = DateTime.now().subtract(Duration(days:5));
var item6 = DateTime.now().subtract(Duration(days:6));
var item7 = DateTime.now().subtract(Duration(days:7));
var item8 = DateTime.now().subtract(Duration(days:8));
var item9 = DateTime.now().subtract(Duration(days:9));
var item10 = DateTime.now().subtract(Duration(days:10));
var item11 = DateTime.now().subtract(Duration(days:11));
var item12 = DateTime.now().subtract(Duration(days:12));
var item13 = DateTime.now().subtract(Duration(days:13));
var item14 = DateTime.now().subtract(Duration(days:14));
var item15 = DateTime.now().subtract(Duration(days:15));
var item16 = DateTime.now().subtract(Duration(days:16));
var item17 = DateTime.now().subtract(Duration(days:17));
var item18 = DateTime.now().subtract(Duration(days:18));
var item19 = DateTime.now().subtract(Duration(days:19));
var item20 = DateTime.now().subtract(Duration(days:20));
var item21 = DateTime.now().subtract(Duration(days:21));
var item22 = DateTime.now().subtract(Duration(days:22));
var item23 = DateTime.now().subtract(Duration(days:23));
var item24 = DateTime.now().subtract(Duration(days:24));
var item25 = DateTime.now().subtract(Duration(days:25));
var item26 = DateTime.now().subtract(Duration(days:27));
var item27 = DateTime.now().subtract(Duration(days:27));
var item28 = DateTime.now().subtract(Duration(days:28));
var item29 = DateTime.now().subtract(Duration(days:29));
var item30 = DateTime.now().subtract(Duration(days:30));
var item31 = DateTime.now().subtract(Duration(days:31));
var item32 = DateTime.now().subtract(Duration(days:32));
var item33 = DateTime.now().subtract(Duration(days:33));

var dateFormat = DateFormat('M/d/yy');

var date1 = dateFormat.format(item1).toString();
var date2 = dateFormat.format(item2).toString();
var date3 = dateFormat.format(item3).toString();
var date4 = dateFormat.format(item4).toString();
var date5 = dateFormat.format(item5).toString();
var date6 = dateFormat.format(item6).toString();
var date7 = dateFormat.format(item7).toString();
var date8 = dateFormat.format(item8).toString();
var date9 = dateFormat.format(item9).toString();
var date10 = dateFormat.format(item10).toString();
var date11 = dateFormat.format(item11).toString();
var date12 = dateFormat.format(item12).toString();
var date13 = dateFormat.format(item13).toString();
var date14 = dateFormat.format(item14).toString();
var date15 = dateFormat.format(item15).toString();
var date16 = dateFormat.format(item16).toString();
var date17 = dateFormat.format(item17).toString();
var date18 = dateFormat.format(item18).toString();
var date19 = dateFormat.format(item19).toString();
var date20 = dateFormat.format(item20).toString();
var date21 = dateFormat.format(item21).toString();
var date22 = dateFormat.format(item22).toString();
var date23 = dateFormat.format(item23).toString();
var date24 = dateFormat.format(item24).toString();
var date25 = dateFormat.format(item25).toString();
var date26 = dateFormat.format(item26).toString();
var date27 = dateFormat.format(item27).toString();
var date28 = dateFormat.format(item28).toString();
var date29 = dateFormat.format(item29).toString();
var date30 = dateFormat.format(item30).toString();
var date31 = dateFormat.format(item31).toString();
var date32 = dateFormat.format(item32).toString();

class JhucsseJson {

  num caseDay1;
  num caseDay2;
  num caseDay3;
  num caseDay4;
  num caseDay5;
  num caseDay6;
  num caseDay7;
  num caseDay8;
  num caseDay9;
  num caseDay10;
  num caseDay11;
  num caseDay12;
  num caseDay13;
  num caseDay14;
  num caseDay15;
  num caseDay16;
  num caseDay17;
  num caseDay18;
  num caseDay19;
  num caseDay20;
  num caseDay21;
  num caseDay22;
  num caseDay23;
  num caseDay24;
  num caseDay25;
  num caseDay26;
  num caseDay27;
  num caseDay28;
  num caseDay29;
  num caseDay30;
  num caseDay31;
  num caseDay32;

  num deathsDay1;
  num deathsDay2;
  num deathsDay3;
  num deathsDay4;
  num deathsDay5;
  num deathsDay6;
  num deathsDay7;

  num recoveredDay1;
  num recoveredDay2;
  num recoveredDay3;
  num recoveredDay4;
  num recoveredDay5;
  num recoveredDay6;
  num recoveredDay7;

  String country;

  JhucsseJson({
    this.caseDay1,
    this.caseDay2,
    this.caseDay3,
    this.caseDay4,
    this.caseDay5,
    this.caseDay6,
    this.caseDay7,

    this.deathsDay1,
    this.deathsDay2,
    this.deathsDay3,
    this.deathsDay4,
    this.deathsDay5,
    this.deathsDay6,
    this.deathsDay7,

    this.recoveredDay1,
    this.recoveredDay2,
    this.recoveredDay3,
    this.recoveredDay4,
    this.recoveredDay5,
    this.recoveredDay6,
    this.recoveredDay7,

    this.country,

  });

  JhucsseJson.fromJson(Map<String, dynamic> json) {
    caseDay1 = json['timeline']['cases'][date1];
    caseDay2 = json['timeline']['cases'][date2];
    caseDay3 = json['timeline']['cases'][date3];
    caseDay4 = json['timeline']['cases'][date4];
    caseDay5 = json['timeline']['cases'][date5];
    caseDay6 = json['timeline']['cases'][date6];
    caseDay7 = json['timeline']['cases'][date7];
    caseDay8 = json['timeline']['cases'][date8];
    caseDay9 = json['timeline']['cases'][date9];
    caseDay10 = json['timeline']['cases'][date10];
    caseDay11 = json['timeline']['cases'][date11];
    caseDay12 = json['timeline']['cases'][date12];
    caseDay13 = json['timeline']['cases'][date13];
    caseDay14 = json['timeline']['cases'][date14];
    caseDay15 = json['timeline']['cases'][date15];
    caseDay16 = json['timeline']['cases'][date16];
    caseDay17 = json['timeline']['cases'][date17];
    caseDay18 = json['timeline']['cases'][date18];
    caseDay19 = json['timeline']['cases'][date19];
    caseDay20 = json['timeline']['cases'][date20];
    caseDay21 = json['timeline']['cases'][date21];
    caseDay22 = json['timeline']['cases'][date22];
    caseDay23 = json['timeline']['cases'][date23];
    caseDay24 = json['timeline']['cases'][date24];
    caseDay25 = json['timeline']['cases'][date25];
    caseDay26 = json['timeline']['cases'][date26];
    caseDay27 = json['timeline']['cases'][date27];
    caseDay28 = json['timeline']['cases'][date28];
    caseDay29 = json['timeline']['cases'][date29];
    caseDay30 = json['timeline']['cases'][date30];
    caseDay31 = json['timeline']['cases'][date31];
    caseDay32 = json['timeline']['cases'][date32];

    deathsDay1 = json['timeline']['deaths'][date1];
    deathsDay2 = json['timeline']['deaths'][date2];
    deathsDay3 = json['timeline']['deaths'][date3];
    deathsDay4 = json['timeline']['deaths'][date4];
    deathsDay5 = json['timeline']['deaths'][date5];
    deathsDay6 = json['timeline']['deaths'][date6];
    deathsDay7 = json['timeline']['deaths'][date7];

    recoveredDay1 = json['timeline']['recovered'][date1];
    recoveredDay2 = json['timeline']['recovered'][date2];
    recoveredDay3 = json['timeline']['recovered'][date3];
    recoveredDay4 = json['timeline']['recovered'][date4];
    recoveredDay5 = json['timeline']['recovered'][date5];
    recoveredDay6 = json['timeline']['recovered'][date6];
    recoveredDay7 = json['timeline']['recovered'][date7];

    country = json['country'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic> ();

    data['timeline']['cases'][date1] = this.caseDay1;
    data['timeline']['cases'][date2] = this.caseDay2;
    data['timeline']['cases'][date3] = this.caseDay3;
    data['timeline']['cases'][date4] = this.caseDay4;
    data['timeline']['cases'][date5] = this.caseDay5;
    data['timeline']['cases'][date6] = this.caseDay6;
    data['timeline']['cases'][date7] = this.caseDay7;
    data['timeline']['cases'][date8] = this.caseDay8;
    data['timeline']['cases'][date9] = this.caseDay9;
    data['timeline']['cases'][date10] = this.caseDay10;
    data['timeline']['cases'][date11] = this.caseDay11;
    data['timeline']['cases'][date12] = this.caseDay12;
    data['timeline']['cases'][date13] = this.caseDay13;
    data['timeline']['cases'][date14] = this.caseDay14;
    data['timeline']['cases'][date15] = this.caseDay15;
    data['timeline']['cases'][date16] = this.caseDay16;
    data['timeline']['cases'][date17] = this.caseDay17;
    data['timeline']['cases'][date18] = this.caseDay18;
    data['timeline']['cases'][date19] = this.caseDay19;
    data['timeline']['cases'][date20] = this.caseDay20;
    data['timeline']['cases'][date21] = this.caseDay21;
    data['timeline']['cases'][date22] = this.caseDay22;
    data['timeline']['cases'][date23] = this.caseDay23;
    data['timeline']['cases'][date24] = this.caseDay24;
    data['timeline']['cases'][date25] = this.caseDay25;
    data['timeline']['cases'][date26] = this.caseDay26;
    data['timeline']['cases'][date27] = this.caseDay27;
    data['timeline']['cases'][date28] = this.caseDay28;
    data['timeline']['cases'][date29] = this.caseDay29;
    data['timeline']['cases'][date30] = this.caseDay30;
    data['timeline']['cases'][date31] = this.caseDay31;
    data['timeline']['cases'][date32] = this.caseDay32;

    data['timeline']['deaths'][date1] = this.deathsDay1;
    data['timeline']['deaths'][date2] = this.deathsDay2;
    data['timeline']['deaths'][date3] = this.deathsDay3;
    data['timeline']['deaths'][date4] = this.deathsDay4;
    data['timeline']['deaths'][date5] = this.deathsDay5;
    data['timeline']['deaths'][date6] = this.deathsDay6;
    data['timeline']['deaths'][date7] = this.deathsDay7;

    data['timeline']['recovered'][date1] = this.recoveredDay1;
    data['timeline']['recovered'][date2] = this.recoveredDay2;
    data['timeline']['recovered'][date3] = this.recoveredDay3;
    data['timeline']['recovered'][date4] = this.recoveredDay4;
    data['timeline']['recovered'][date5] = this.recoveredDay5;
    data['timeline']['recovered'][date6] = this.recoveredDay6;
    data['timeline']['recovered'][date7] = this.recoveredDay7;

    data['country'] = this.country;

    return data;
  }
}