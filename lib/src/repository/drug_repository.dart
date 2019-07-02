import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' show Client;
import 'package:meta/meta.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/drug.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrugRepository {
  final Client client = Client();
  Future<List<Drug>> getCommonDrug() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        '$baseUrl/api/drugs/common',
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Drugs.fromJson(jsonDecode(response.body)).drugs;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Drug> getDrug({@required String genericName}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        '$baseUrl/api/drug/$genericName',
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Drug.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Drug>> searchDrug({@required String query}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        '$baseUrl/api/drugs/search?query=$query',
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Drugs.fromJson(jsonDecode(response.body)).drugs;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

final DrugRepository drugRepository = DrugRepository();
