class FirebaseJson {

  String date;

  FirebaseJson({

    this.date,

  });

  FirebaseJson.fromJson(Map<String, dynamic> json) {
    date = json['date'];

  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic> ();

    data['date'] = this.date;

    return data;
  }
}