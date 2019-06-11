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
    data['email'] = this.email;
    data['password'] = this.password;
    if (this.name != null) {
      data['name'] = this.name;
    }
    return data;
  }
}
