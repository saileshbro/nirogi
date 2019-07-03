class News {
  List<NewsItem> news;

  News({this.news});

  News.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = new List<NewsItem>();
      json['news'].forEach((v) {
        news.add(new NewsItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsItem {
  int newsId;
  String title;
  String imageUrl;
  String description;
  String body;
  String writtenBy;
  String updatedAt;

  NewsItem(
      {this.newsId,
      this.title,
      this.imageUrl,
      this.description,
      this.body,
      this.writtenBy,
      this.updatedAt});

  NewsItem.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    body = json['body'];
    writtenBy = json['written_by'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_id'] = this.newsId;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['body'] = this.body;
    data['written_by'] = this.writtenBy;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
