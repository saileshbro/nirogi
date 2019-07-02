class Users {
  List<User> users;

  Users({this.users});

  Users.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = new List<User>();
      json['users'].forEach((v) {
        users.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
