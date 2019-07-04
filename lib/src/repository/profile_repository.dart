import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' show Client;
import 'package:meta/meta.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository {
  final client = Client();
  Future<User> getMyProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get("$baseUrl/api/users/me", headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json',
      });
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

  Future<List<User>> getAllUsers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get("$baseUrl/api/users", headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Users.fromJson(jsonDecode(response.body)).users;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User> getUserProfile({@required int userId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get("$baseUrl/api/users/$userId", headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json',
      });
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

  Future<User> updateProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.patch("$baseUrl/api/users/me", headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json',
      });
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

  Future<String> changePassword(
      {@required ChangePassword passwordModel}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post('$baseUrl/api/users/changepw',
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            HttpHeaders.contentTypeHeader: 'application/json'
          },
          body: jsonEncode(passwordModel.toJson()));
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else if (responseData.containsKey('message')) {
        return responseData['message'];
      } else {
        throw "Unexpected error occured!";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> forgetPassword({@required String email}) async {
    try {
      final Map<String, dynamic> body = new Map<String, dynamic>();
      body["email"] = email;
      final response = await client.post('$baseUrl/api/users/forgot',
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode(body));
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else if (responseData.containsKey('message')) {
        return responseData['message'];
      } else {
        throw "Unexpected error occured!";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

final ProfileRepository profileRepository = ProfileRepository();
