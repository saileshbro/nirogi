import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostRepository {
  final client = Client();
  Future<List<Post>> getAllPost({String sort = 'popular'}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response =
          await client.get("$baseUrl/api/posts?sort=$sort", headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Posts.fromJson(jsonDecode(response.body)).posts;
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        throw "Network Error.";
      }
      throw e.toString();
    }
  }

  Future<List<Post>> getAllMyPosts() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get("$baseUrl/api/posts/me", headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Posts.fromJson(jsonDecode(response.body)).posts;
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        throw "Network Error.";
      }
      throw e.toString();
    }
  }

  Future<List<Post>> getUsersPosts({@required int userId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response =
          await client.get("$baseUrl/api/posts/user/$userId", headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Posts.fromJson(jsonDecode(response.body)).posts;
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        throw "Network Error.";
      }
      throw e.toString();
    }
  }

  Future<List<Post>> viewCategoryPosts({@required int categoryId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response =
          await client.get("$baseUrl/api/posts/category/$categoryId", headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Posts.fromJson(jsonDecode(response.body)).posts;
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        throw "Network Error.";
      }
      throw e.toString();
    }
  }

  Future<String> addPost({@required Post post}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post(
        "$baseUrl/api/posts",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode(post.toJson()),
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
      }
      throw e.toString();
    }
  }

  Future<Post> viewPost({@required int postId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get('$baseUrl/api/post/$postId', headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json'
      });
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Post.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        throw "Network Error.";
      }
      throw e.toString();
    }
  }

  Future<String> updatePost(
      {@required int postId, @required Post updatePost}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.patch(
        '$baseUrl/api/post/$postId',
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
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
      if (e is SocketException || e is ClientException) {
        throw "Network Error.";
      }
      throw e.toString();
    }
  }

  Future<String> deletePost({@required postId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response =
          await client.delete('$baseUrl/api/post/$postId', headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json'
      });
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
      }
      throw e.toString();
    }
  }

  Future<int> upvotePost({@required postId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response =
          await client.post('$baseUrl/api/post/$postId/upvote', headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json'
      });
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
      }
      throw e.toString();
    }
  }

  Future<int> downvotePost({@required postId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response =
          await client.post('$baseUrl/api/post/$postId/downvote', headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json'
      });
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
      }
      throw e.toString();
    }
  }

  Future<int> getPostVoteCount({@required int postId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response =
          await client.get('$baseUrl/api/post/$postId/votecount', headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json'
      });
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
      }
      throw e.toString();
    }
  }

  Future<String> commentPost(
      {@required postId, @required Comment newComment}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post(
        "$baseUrl/api/post/$postId/comment",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode(newComment.toJson()),
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
      }
      throw e.toString();
    }
  }

  Future<List<Comment>> getAllCommentsFromPost(
      {@required int postId, String sort = 'time'}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        "$baseUrl/api/post/$postId/comments?sort=$sort",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Comments.fromJson(jsonDecode(response.body)).comments;
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        throw "Network Error.";
      }
      throw e.toString();
    }
  }

  Future<Comment> getSingleCommentFromPost(
      {@required int postId, @required int commentId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
        "$baseUrl/api/post/$postId/comment/$commentId",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
      );
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('error')) {
        throw responseData['error'];
      } else {
        return Comment.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        throw "Network Error.";
      }
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
        "$baseUrl/api/post/$postId/comment/$commentId",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json'
        },
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
      if (e is SocketException || e is ClientException) {
        throw "Network Error.";
      }
      throw e.toString();
    }
  }

  Future<int> upvoteComment(
      {@required int postId, @required int commentId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post(
        "$baseUrl/api/post/$postId/comment/$commentId/upvote",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json'
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
      }
      throw e.toString();
    }
  }

  Future<int> downvoteComment(
      {@required int postId, @required int commentId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post(
        "$baseUrl/api/post/$postId/comment/$commentId/downvote",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json'
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
      }
      throw e.toString();
    }
  }

  Future<String> deleteComment(
      {@required int postId, @required commentId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.delete(
        "$baseUrl/api/post/$postId/comment/$commentId",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json'
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
      }
      throw e.toString();
    }
  }

  Future<String> incrementViewOfAPost({@required int postId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.post(
        "$baseUrl/api/post/$postId/inc",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: 'application/json'
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
      }
      throw e.toString();
    }
  }

  Future<int> getCommentVoteCount(
      {@required int postId, @required int commentId}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await client.get(
          '$baseUrl/api/post/$postId/comment/$commentId/votecount',
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            HttpHeaders.contentTypeHeader: 'application/json'
          });
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
      }
      throw e.toString();
    }
  }
}

final PostRepository postRepository = PostRepository();
