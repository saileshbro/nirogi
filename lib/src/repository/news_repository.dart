import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsReposirory {
  final client = Client();
  Future<List<NewsItem>> getAllNews() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        '$baseUrl/api/news',
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return News.fromJson(jsonDecode(response.body)).news;
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        throw "Network Error";
      } else {
        throw e.toString();
      }
    }
  }

  Future<NewsItem> getNewsItem({@required int newsId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        '$baseUrl/api/news/$newsId',
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return NewsItem.fromJson(jsonDecode(response.body));
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

final NewsReposirory newsRepository = NewsReposirory();
