class Drugs {
  List<Drug> drugs;

  Drugs({this.drugs});

  Drugs.fromJson(Map<String, dynamic> json) {
    if (json['drugs'] != null) {
      drugs = new List<Drug>();
      json['drugs'].forEach((v) {
        drugs.add(new Drug.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drugs != null) {
      data['drugs'] = this.drugs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Drug {
  String brandName;
  String genericName;
  String imageUrl;
  String dose;
  String summary;
  List<Section> sections;

  Drug(
      {this.brandName,
      this.genericName,
      this.imageUrl,
      this.dose,
      this.summary,
      this.sections});

  Drug.fromJson(Map<String, dynamic> json) {
    brandName = json['brandName'];
    genericName = json['genericName'];
    imageUrl = json['imageUrl'];
    dose = json['dose'];
    summary = json['summary'];
    if (json['sections'] != null) {
      sections = new List<Section>();
      json['sections'].forEach((v) {
        sections.add(new Section.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brandName'] = this.brandName;
    data['genericName'] = this.genericName;
    data['imageUrl'] = this.imageUrl;
    data['dose'] = this.dose;
    data['summary'] = this.summary;
    if (this.sections != null) {
      data['sections'] = this.sections.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Section {
  String title;
  String content;

  Section({this.title, this.content});

  Section.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}
