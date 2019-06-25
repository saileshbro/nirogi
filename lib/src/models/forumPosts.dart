class Post {
  int postId;
  String title;
  String body;
  int views;
  int voteCount;
  int commentCount;
  String updatedAt;
  int categoryId;
  String category;
  int userId;
  String name;
  String imageUrl;
  dynamic voteStatus;

  Post(
      {this.postId,
      this.title,
      this.body,
      this.views,
      this.voteCount,
      this.commentCount,
      this.updatedAt,
      this.categoryId,
      this.category,
      this.userId,
      this.name,
      this.imageUrl,
      this.voteStatus});

  Post.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    title = json['title'];
    body = json['body'];
    views = json['views'];
    voteCount = json['vote_count'];
    commentCount = json['comment_count'];
    updatedAt = json['updated_at'];
    categoryId = json['category_id'];
    category = json['category'];
    userId = json['user_id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    voteStatus = json['vote_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['views'] = this.views;
    data['vote_count'] = this.voteCount;
    data['comment_count'] = this.commentCount;
    data['updated_at'] = this.updatedAt;
    data['category_id'] = this.categoryId;
    data['category'] = this.category;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['vote_status'] = this.voteStatus;
    return data;
  }
}

List<Post> posts = [
  Post(
    postId: 3,
    title: "Post 2",
    body: "This is Post 2",
    views: 0,
    voteCount: 0,
    commentCount: 0,
    updatedAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "Post 2",
    body: "This is Post 2",
    views: 0,
    voteCount: 0,
    commentCount: 0,
    updatedAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "Post 2",
    body: "This is Post 2",
    views: 0,
    voteCount: 0,
    commentCount: 0,
    updatedAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "Post 2",
    body: "This is Post 2",
    views: 0,
    voteCount: 0,
    commentCount: 0,
    updatedAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "Post 2",
    body: "This is Post 2",
    views: 0,
    voteCount: 0,
    commentCount: 0,
    updatedAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "Post 2",
    body: "This is Post 2",
    views: 0,
    voteCount: 0,
    commentCount: 0,
    updatedAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "Post 2",
    body: "This is Post 2",
    views: 0,
    voteCount: 0,
    commentCount: 0,
    updatedAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "Post 2",
    body: "This is Post 2",
    views: 0,
    voteCount: 0,
    commentCount: 0,
    updatedAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "Post 2",
    body: "This is Post 2",
    views: 0,
    voteCount: 0,
    commentCount: 0,
    updatedAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "Post 2",
    body: "This is Post 2",
    views: 0,
    voteCount: 0,
    commentCount: 0,
    updatedAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
  Post(
    postId: 3,
    title: "Post 2",
    body: "This is Post 2",
    views: 0,
    voteCount: 0,
    commentCount: 0,
    updatedAt: "7 hours",
    categoryId: 6,
    category: "Infections",
    userId: 1,
    name: "Sailesh Dahal",
    imageUrl: "assets/images/icons/imageUrl.png",
    voteStatus: null,
  ),
];
