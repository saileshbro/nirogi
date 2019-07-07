import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' show Client;
import 'package:meta/meta.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProvinceRepository {
  final Client client = Client();
  Future<List<Province>> getProvinces() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        '$baseUrl/api/provinces',
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Provinces.fromJson(jsonDecode(response.body)).provinces;
      }
    } catch (e) {
      if (e is SocketException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
    }
  }

  Future<Province> getProvince({@required int provinceId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        '$baseUrl/api/province/$provinceId',
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Province.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      if (e is SocketException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
    }
  }
}

final ProvinceRepository provinceRepository = ProvinceRepository();
