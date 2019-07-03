class Diseases {
  List<Disease> diseases;

  Diseases({this.diseases});

  Diseases.fromJson(Map<String, dynamic> json) {
    if (json['diseases'] != null) {
      diseases = new List<Disease>();
      json['diseases'].forEach((v) {
        diseases.add(new Disease.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.diseases != null) {
      data['diseases'] = this.diseases.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Disease {
  int diseaseId;
  String disease;
  String description;
  String imageUrl;
  String body;

  Disease({
    this.diseaseId,
    this.disease,
    this.imageUrl,
    this.description,
    this.body,
  });

  Disease.fromJson(Map<String, dynamic> json) {
    diseaseId = json['disease_id'];
    disease = json['disease'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disease_id'] = this.diseaseId;
    data['disease'] = this.disease;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['body'] = this.body;
    return data;
  }
}
