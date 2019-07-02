import 'package:nirogi/src/repository/firstaid_repository.dart';

class Firstaids {
  List<Firstaid> firstaids;

  Firstaids({this.firstaids});

  Firstaids.fromJson(Map<String, dynamic> json) {
    if (json['firstaids'] != null) {
      firstaids = new List<Firstaid>();
      json['firstaids'].forEach((v) {
        firstaids.add(new Firstaid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.firstaids != null) {
      data['firstaids'] = this.firstaids.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Firstaid {
  int firstAidId;
  String title;
  String body;
  String imageUrl;

  Firstaid({this.firstAidId, this.title, this.body, this.imageUrl});

  Firstaid.fromJson(Map<String, dynamic> json) {
    firstAidId = json['first_aid_id'];
    title = json['title'];
    body = json['body'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_aid_id'] = this.firstAidId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

final FirstAidRepository firstAidRepository = FirstAidRepository();
