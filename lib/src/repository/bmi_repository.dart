import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BmiRepository {
  final Client client = Client();
  Future<List<Bmi>> getBmiRecords() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        "$baseUrl/api/user/bmi",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Bmis.fromJson(jsonDecode(response.body)).bmi;
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        throw "Network Error.";
      } else {
        throw e.toString();
      }
    }
  }

  Future<String> addRecord({@required Bmi bmi}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post(
        "$baseUrl/api/user/bmi",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(bmi.toJson()),
      );
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
        throw "Network Error.";
      } else {
        throw e.toString();
      }
    }
  }

  Future<String> clearRecord() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.delete(
        "$baseUrl/api/user/bmi",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
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
        throw "Network Error.";
      } else {
        throw e.toString();
      }
    }
  }
}

final BmiRepository bmiRepository = BmiRepository();
