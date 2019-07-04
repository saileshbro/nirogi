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
  int postid;
  String name;
  String address;
  String imageUrl;
  int commentId;
  String comment;
  int voteCount;
  String createdAt;
  dynamic voteStatus;
  bool canModifyComment;

  Comment(
      {this.userId,
      this.postid,
      this.name,
      this.address,
      this.imageUrl,
      this.commentId,
      this.comment,
      this.voteCount,
      this.createdAt,
      this.voteStatus,
      this.canModifyComment});

  Comment.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    postid = json['post_id'];
    name = json['name'];
    address = json['address'];
    imageUrl = json['imageUrl'];
    commentId = json['comment_id'];
    comment = json['comment'];
    voteCount = json['vote_count'];
    createdAt = json['created_at'];
    voteStatus = json['vote_status'];
    canModifyComment = json['can_modify_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['post_id'] = this.postid;
    data['name'] = this.name;
    data['address'] = this.address;
    data['imageUrl'] = this.imageUrl;
    data['comment_id'] = this.commentId;
    data['comment'] = this.comment;
    data['vote_count'] = this.voteCount;
    data['created_at'] = this.createdAt;
    data['vote_status'] = this.voteStatus;
    data['can_modify_comment'] = this.canModifyComment;
    return data;
  }
}
