class ChangePassword {
  String newpw;
  String currentpw;
  String confirmpw;
  ChangePassword({this.newpw, this.currentpw, this.confirmpw});

  ChangePassword.fromJson(Map<String, dynamic> json) {
    newpw = json['newpw'];
    currentpw = json['currentpw'];
    confirmpw = json['confirmpw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newpw'] = this.newpw;
    data['currentpw'] = this.currentpw;
    data['confirmpw'] = this.confirmpw;
    return data;
  }
}
