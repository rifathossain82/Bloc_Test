class NewsData {
  List<News>? news;
  String? message;
  int? status;

  NewsData({this.news, this.message, this.status});

  NewsData.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class News {
  String? image;
  String? title;
  String? description;

  News({this.image, this.title, this.description});

  News.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? "";
    title = json['title'] ?? "";
    description = json['description'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
