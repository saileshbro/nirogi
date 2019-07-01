class Provinces {
  List<Province> provinces;

  Provinces({this.provinces});

  Provinces.fromJson(Map<String, dynamic> json) {
    if (json['provinces'] != null) {
      provinces = new List<Province>();
      json['provinces'].forEach((v) {
        provinces.add(new Province.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.provinces != null) {
      data['provinces'] = this.provinces.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Province {
  int provinceId;
  String title;
  String imageUrl;
  String body;

  Province({this.provinceId, this.title, this.imageUrl, this.body});

  Province.fromJson(Map<String, dynamic> json) {
    provinceId = json['province_id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['province_id'] = this.provinceId;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['body'] = this.body;
    return data;
  }
}
