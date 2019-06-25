List<Post> allPosts = [
  Post(
      title: "Solution to Alzeimer disease",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      createdAt: "9",
      views: 15,
      voteCount: 11,
      commentCount: 2),
  Post(
      title: "Solution to Alzeimer disease",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      createdAt: "9",
      views: 15,
      voteCount: 11,
      commentCount: 2),
  Post(
      title: "Solution to Alzeimer disease",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      createdAt: "9",
      views: 15,
      voteCount: 11,
      commentCount: 2),
  Post(
      title: "Solution to Alzeimer disease",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      createdAt: "9",
      views: 15,
      voteCount: 11,
      commentCount: 2),
  Post(
      title: "Solution to Alzeimer disease",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      createdAt: "9",
      views: 15,
      voteCount: 11,
      commentCount: 2),
  Post(
      title: "Solution to Alzeimer disease",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      createdAt: "9",
      views: 15,
      voteCount: 11,
      commentCount: 2),
  Post(
      title: "Solution to Alzeimer disease",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      createdAt: "9",
      views: 15,
      voteCount: 11,
      commentCount: 2),
];

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

  Post({
    this.postId,
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
  });

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
    return data;
  }
}
