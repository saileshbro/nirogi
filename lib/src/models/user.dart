class User {
  int userId;
  String name;
  String email;
  String imageUrl;
  String address;
  String updatedAt;
  String token;
  String password;

  User(
      {this.userId,
      this.name,
      this.password,
      this.email,
      this.imageUrl,
      this.address,
      this.updatedAt,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['imageUrl'] = this.imageUrl;
    data['address'] = this.address;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    data['password'] = this.password;
    return data;
  }
}
