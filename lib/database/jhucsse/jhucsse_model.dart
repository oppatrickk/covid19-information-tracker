final String date = '4/4/21';

class JhucsseJson {

  num day1;

  JhucsseJson({
    this.day1,

});

  JhucsseJson.fromJson(Map<String, dynamic> json) {
    day1 = json['timeline']['cases']['4/10/21'];

  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic> ();

    data['timeline']['cases']['4/10/21'] = this.day1;

    return data;
  }
}