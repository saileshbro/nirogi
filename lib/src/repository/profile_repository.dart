import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository {
  final client = Client();
  Dio dio = Dio();
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
      if (e is SocketException || e is ClientException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
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
      if (e is SocketException || e is ClientException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
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
      if (e is SocketException || e is ClientException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
    }
  }

  Future<String> updateProfile({@required User updateUser}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.patch("$baseUrl/api/users/me",
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(updateUser.toJson()));
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else if (responseData.containsKey('message')) {
        return responseData['message'];
      } else {
        throw "Unexpected error occured!";
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
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
      if (e is SocketException || e is ClientException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
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
      if (e is SocketException || e is ClientException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
    }
  }

  Future<String> uploadProfilePicture({@required File image}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      Dio dio = new Dio();
      FormData formdata = new FormData();
      formdata.add("avatar", new UploadFileInfo(image, (image.path)));
      final response = await dio.post(
        "$baseUrl/api/users/me/avatar",
        data: formdata,
        options: Options(
            method: 'POST',
            responseType: ResponseType.json,
            headers: <String, dynamic>{
              'Authorization': "Bearer $token",
            }),
      );
      if (response.statusCode == 200) {
        return "Success";
      } else {
        return "Error";
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
    }
  }
}

final ProfileRepository profileRepository = ProfileRepository();
