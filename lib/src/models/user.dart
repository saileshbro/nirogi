class User {
  int id;
  String name;
  String email;
  String token;
  String password;

  User({this.id, this.name, this.email, this.token, this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}
