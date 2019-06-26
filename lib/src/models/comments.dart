class Comments {
  List<Comment> comments;

  Comments({this.comments});

  Comments.fromJson(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      comments = new List<Comment>();
      json['comments'].forEach((v) {
        comments.add(new Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comment {
  int userId;
  String name;
  String imageUrl;
  int commentId;
  String comment;
  int voteCount;
  String createdAt;
  dynamic voteStatus;

  Comment({
    this.userId,
    this.name,
    this.imageUrl,
    this.commentId,
    this.comment,
    this.voteCount,
    this.createdAt,
    this.voteStatus,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    commentId = json['comment_id'];
    comment = json['comment'];
    voteCount = json['vote_count'];
    createdAt = json['created_at'];
    voteStatus = json['vote_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['comment_id'] = this.commentId;
    data['comment'] = this.comment;
    data['vote_count'] = this.voteCount;
    data['created_at'] = this.createdAt;
    data['vote_status'] = this.voteStatus;
    return data;
  }
}

List<Comment> comments = [
  Comment(
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "public/uploads/avatar1.jpg",
    commentId: 4,
    comment: "this is comment 3",
    voteCount: 0,
    createdAt: "27 minutes ago",
    voteStatus: null,
  ),
  Comment(
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "public/uploads/avatar1.jpg",
    commentId: 4,
    comment: "this is comment 3",
    voteCount: 0,
    createdAt: "27 minutes ago",
    voteStatus: null,
  ),
  Comment(
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "public/uploads/avatar1.jpg",
    commentId: 4,
    comment: "this is comment 3",
    voteCount: 0,
    createdAt: "27 minutes ago",
    voteStatus: null,
  ),
  Comment(
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "public/uploads/avatar1.jpg",
    commentId: 4,
    comment: "this is comment 3",
    voteCount: 0,
    createdAt: "27 minutes ago",
    voteStatus: -1,
  ),
  Comment(
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "public/uploads/avatar1.jpg",
    commentId: 4,
    comment: "this is comment 3",
    voteCount: 0,
    createdAt: "27 minutes ago",
    voteStatus: null,
  ),
  Comment(
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "public/uploads/avatar1.jpg",
    commentId: 4,
    comment: "this is comment 3",
    voteCount: 0,
    createdAt: "27 minutes ago",
    voteStatus: 1,
  ),
  Comment(
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "public/uploads/avatar1.jpg",
    commentId: 4,
    comment: "this is comment 3",
    voteCount: 0,
    createdAt: "27 minutes ago",
    voteStatus: 1,
  ),
  Comment(
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "public/uploads/avatar1.jpg",
    commentId: 4,
    comment: "this is comment 3",
    voteCount: 0,
    createdAt: "27 minutes ago",
    voteStatus: -1,
  ),
  Comment(
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "public/uploads/avatar1.jpg",
    commentId: 4,
    comment: "this is comment 3",
    voteCount: 0,
    createdAt: "27 minutes ago",
    voteStatus: 1,
  ),
  Comment(
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "public/uploads/avatar1.jpg",
    commentId: 4,
    comment: "this is comment 3",
    voteCount: 0,
    createdAt: "27 minutes ago",
    voteStatus: null,
  ),
  Comment(
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "public/uploads/avatar1.jpg",
    commentId: 4,
    comment: "this is comment 3",
    voteCount: 0,
    createdAt: "27 minutes ago",
    voteStatus: null,
  ),
];
