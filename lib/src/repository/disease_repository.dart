import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:meta/meta.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiseaseRepository {
  final client = Client();
  Future<List<Disease>> getTopDiseases() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        "$baseUrl/api/diseases/top",
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
      if (e is SocketException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
    }
  }

  Future<List<Disease>> getAllDiseases() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        "$baseUrl/api/diseases",
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
      if (e is SocketException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
    }
  }

  Future<List<Disease>> searchDiseases({@required String query}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        "$baseUrl/api/diseases/search/$query",
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
      if (e is SocketException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
    }
  }

  Future<Disease> getDisease({@required int diseaseId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        "$baseUrl/api/disease/$diseaseId",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Disease.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      if (e is SocketException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
    }
  }

  Future<String> addDisease({@required Disease disease}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post(
        "$baseUrl/api/diseases",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode(disease.toJson()),
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
      if (e is SocketException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
    }
  }
}

final DiseaseRepository diseaseRepository = DiseaseRepository();
