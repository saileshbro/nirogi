import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:meta/meta.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/comments.dart';
import 'package:nirogi/src/models/posts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostRepository {
  final client = Client();
  Future<List<Post>> getAllPost({String sort = 'popular'}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get("$baseUrl/posts?sort=$sort", headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
      });
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Posts.fromJson(jsonDecode(response.body)).posts;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Post> addPost({@required Post post}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post(
        "$baseUrl/posts",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
        body: jsonEncode(post.toJson()),
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Post.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Post> viewPost({@required int postId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get('$baseUrl/post/$postId',
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Post.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> updatePost(
      {@required int postId, @required Post updatePost}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.patch(
        '$baseUrl/post/$postId',
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        body: jsonEncode(updatePost.toJson()),
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
      throw e.toString();
    }
  }

  Future<String> deletePost({@required postId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.delete('$baseUrl/post/$postId',
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
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

  Future<String> upvotePost({@required postId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post('$baseUrl/post/$postId/upvote',
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
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

  Future<String> downvotePost({@required postId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post('$baseUrl/post/$postId/downvote',
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
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

  Future<Comment> commentPost(
      {@required postId, @required Comment comment}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post(
        '$baseUrl/post/$postId/comment',
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        body: jsonEncode(comment.toJson()),
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
      throw e.toString();
    }
  }

  Future<List<Comment>> getAllCommentsFromPost(
      {@required int postId, String sort = 'time'}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        "$baseUrl/post/$postId/comments?sort=$sort",
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Comments.fromJson(jsonDecode(response.body)).comments;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Comment> getSingleCommentFromPost(
      {@required int postId, @required int commentId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        "$baseUrl/post/$postId/comment/$commentId",
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Comment.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> updateComment({
    @required int postId,
    @required int commentId,
    @required Comment comment,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.patch(
        "$baseUrl/post/$postId/comment/$commentId",
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        body: jsonEncode(comment.toJson()),
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
      throw e.toString();
    }
  }

  Future<String> upvoteComment(
      {@required int postId, @required int commentId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post(
        "$baseUrl/post/$postId/comment/$commentId/upvote",
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
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
      throw e.toString();
    }
  }

  Future<String> downvoteComment(
      {@required int postId, @required int commentId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post(
        "$baseUrl/post/$postId/comment/$commentId/downvote",
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
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
      throw e.toString();
    }
  }

  Future<String> deleteComment(
      {@required int postId, @required commentId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.delete(
        "$baseUrl/post/$postId/comment/$commentId",
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
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
      throw e.toString();
    }
  }
}