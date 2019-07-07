import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodTipsRepository {
  final client = Client();
  Future<List<Disease>> getFoodTipsDiseases() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        '$baseUrl/api/tips/diseases',
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Diseases.fromJson(jsonDecode(response.body)).diseases;
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
    }
  }

  Future<FoodTips> getFoodTipsForDisease({@required int diseaseId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        '$baseUrl/api/tips/disease/$diseaseId',
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return FoodTips.fromJson(jsonDecode(response.body));
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

final FoodTipsRepository foodTipsRepository = FoodTipsRepository();
