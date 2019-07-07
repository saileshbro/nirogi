class Bmis {
  List<Bmi> bmi;

  Bmis({this.bmi});

  Bmis.fromJson(Map<String, dynamic> json) {
    if (json['bmi'] != null) {
      bmi = new List<Bmi>();
      json['bmi'].forEach((v) {
        bmi.add(new Bmi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bmi != null) {
      data['bmi'] = this.bmi.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bmi {
  double value;
  String createdAt;

  Bmi({this.value, this.createdAt});

  Bmi.fromJson(Map<String, dynamic> json) {
    value = json['value'] * 1.0;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['created_at'] = this.createdAt;
    return data;
  }
}
