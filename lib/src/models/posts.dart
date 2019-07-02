import 'package:nirogi/src/models/comments.dart';

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
  int categoryId;
  String category;
  int userId;
  String name;
  String imageUrl;
  dynamic voteStatus;
  List<Comment> comments;

  Post(
      {this.postId,
      this.title,
      this.body,
      this.views,
      this.voteCount,
      this.commentCount,
      this.createdAt,
      this.categoryId,
      this.category,
      this.userId,
      this.name,
      this.imageUrl,
      this.voteStatus,
      this.comments});

  Post.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    title = json['title'];
    body = json['body'];
    views = json['views'];
    voteCount = json['vote_count'];
    commentCount = json['comment_count'];
    createdAt = json['created_at'];
    categoryId = json['category_id'];
    category = json['category'];
    userId = json['user_id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    voteStatus = json['vote_status'];
    if (json['comments'] != null) {
      comments = new List<Comment>();
      json['comments'].forEach((v) {
        comments.add(new Comment.fromJson(v));
      });
    }
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
    data['category_id'] = this.categoryId;
    data['category'] = this.category;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['vote_status'] = this.voteStatus;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

List<Post> posts = [
  Post(
    postId: 3,
    title: "The solution for extreme toothache",
    body:
        "This is The solution for extreme toothache This is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothache",
    views: 146,
    voteCount: 146,
    commentCount: 146,
    createdAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "The solution for extreme toothache",
    body:
        " This is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothache",
    views: 146,
    voteCount: 146,
    commentCount: 146,
    createdAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "The solution for extreme toothache",
    body:
        " This is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothache",
    views: 146,
    voteCount: 146,
    commentCount: 146,
    createdAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title:
        "The solution for extreme toothacheThe solution for extreme toothache",
    body:
        " This is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothache",
    views: 146,
    voteCount: 146,
    commentCount: 146,
    createdAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "The solution for extreme toothache",
    body:
        " This is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothache",
    views: 146,
    voteCount: 146,
    commentCount: 146,
    createdAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "The solution for extreme toothache",
    body:
        " This is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothache",
    views: 146,
    voteCount: 146,
    commentCount: 146,
    createdAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "The solution for extreme toothache",
    body:
        " This is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothache",
    views: 146,
    voteCount: 146,
    commentCount: 146,
    createdAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "The solution for extreme toothache",
    body:
        " This is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothache",
    views: 146,
    voteCount: 146,
    commentCount: 146,
    createdAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "The solution for extreme toothache",
    body:
        " This is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothache",
    views: 146,
    voteCount: 146,
    commentCount: 146,
    createdAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "The solution for extreme toothache",
    body:
        " This is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothache",
    views: 146,
    voteCount: 146,
    commentCount: 146,
    createdAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "The solution for extreme toothache",
    body:
        " This is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothacheThis is The solution for extreme toothache",
    views: 146,
    voteCount: 146,
    commentCount: 146,
    createdAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
];
