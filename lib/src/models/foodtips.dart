class FoodTips {
  int diseaseId;
  String disease;
  List<ToEat> toeat;
  List<ToAvoid> toavoid;

  FoodTips({this.diseaseId, this.disease, this.toeat, this.toavoid});

  FoodTips.fromJson(Map<String, dynamic> json) {
    diseaseId = json['disease_id'];
    disease = json['disease'];
    if (json['toeat'] != null) {
      toeat = new List<ToEat>();
      json['toeat'].forEach((v) {
        toeat.add(new ToEat.fromJson(v));
      });
    }
    if (json['toavoid'] != null) {
      toavoid = new List<ToAvoid>();
      json['toavoid'].forEach((v) {
        toavoid.add(new ToAvoid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disease_id'] = this.diseaseId;
    data['disease'] = this.disease;
    if (this.toeat != null) {
      data['toeat'] = this.toeat.map((v) => v.toJson()).toList();
    }
    if (this.toavoid != null) {
      data['toavoid'] = this.toavoid.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ToEat {
  String name;
  String imageUrl;

  ToEat({this.name, this.imageUrl});

  ToEat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

class ToAvoid {
  String name;
  String imageUrl;

  ToAvoid({this.name, this.imageUrl});

  ToAvoid.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
