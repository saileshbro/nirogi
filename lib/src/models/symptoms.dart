class Symptoms {
  List<Symptom> symptoms;

  Symptoms({this.symptoms});

  Symptoms.fromJson(Map<String, dynamic> json) {
    if (json['symptoms'] != null) {
      symptoms = new List<Symptom>();
      json['symptoms'].forEach((v) {
        symptoms.add(new Symptom.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.symptoms != null) {
      data['symptoms'] = this.symptoms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Symptom {
  int symptomId;
  String symptom;
  String imageUrl;
  String description;
  String body;

  Symptom({
    this.symptomId,
    this.symptom,
    this.imageUrl,
    this.description,
    this.body,
  });

  Symptom.fromJson(Map<String, dynamic> json) {
    symptomId = json['symptom_id'];
    symptom = json['symptom'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symptom_id'] = this.symptomId;
    data['symptom'] = this.symptom;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['body'] = this.body;
    return data;
  }
}
