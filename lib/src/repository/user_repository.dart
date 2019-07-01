import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' show Client;
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final client = Client();
  Future<String> authenticate({
    @required String email,
    @required String password,
  }) async {
    final user = User(email: email, password: password);
    try {
      final response = await client.post('$baseUrl/api/users/login',
          body: jsonEncode(user.toJson()),
          headers: {'Content-Type': 'application/json'});
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        User user = User.fromJson(jsonDecode(response.body));
        return user.token;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> signup({
    @required String email,
    @required String password,
    @required String name,
  }) async {
    final user = User(email: email, password: password, name: name);
    try {
      final response = await client.post('$baseUrl/api/users/signup',
          body: jsonEncode(user.toJson()),
          headers: {'Content-Type': 'application/json'});
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        User user = User.fromJson(jsonDecode(response.body));
        return user.token;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
    return;
  }

  Future<void> persistToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
    return;
  }

  Future<bool> hasToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.containsKey('token');
  }
}
