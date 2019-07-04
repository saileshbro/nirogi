import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:http/http.dart' show Client;
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final client = Client();
  Future<User> authenticate({
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
        return user;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User> signup({
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
        return user;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
    preferences.remove('name');
    preferences.remove('imageUrl');
    return;
  }

  Future<void> persistToken(
      {@required String token,
      @required String name,
      @required String imageUrl}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
    preferences.setString('name', name);
    preferences.setString('imageUrl', imageUrl ?? "");
    return;
  }

  Future<bool> hasToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.containsKey('token');
  }

  Future<User> getLoggedInUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        "$baseUrl/api/users/me",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

final UserRepository userRepository = UserRepository();
