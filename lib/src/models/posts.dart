import 'package:nirogi/src/models/models.dart';

class Posts {
  List<Post> posts;

  Posts({this.posts});

  Posts.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = new List<Post>();
      json['posts'].forEach((v) {
        posts.add(new Post.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  int postId;
  String title;
  String body;
  int views;
  int voteCount;
  int commentCount;
  String createdAt;
  int userId;
  String name;
  String address;
  String imageUrl;
  dynamic voteStatus;
  bool canModifyPost;
  Category category;

  Post(
      {this.postId,
      this.title,
      this.body,
      this.views,
      this.voteCount,
      this.commentCount,
      this.createdAt,
      this.userId,
      this.name,
      this.address,
      this.imageUrl,
      this.voteStatus,
      this.canModifyPost,
      this.category});

  Post.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    title = json['title'];
    body = json['body'];
    views = json['views'];
    voteCount = json['vote_count'];
    commentCount = json['comment_count'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    imageUrl = json['imageUrl'];
    voteStatus = json['vote_status'];
    canModifyPost = json['can_modify_post'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['views'] = this.views;
    data['vote_count'] = this.voteCount;
    data['comment_count'] = this.commentCount;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['imageUrl'] = this.imageUrl;
    data['vote_status'] = this.voteStatus;
    data['can_modify_post'] = this.canModifyPost;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}
