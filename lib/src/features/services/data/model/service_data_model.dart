class ServiceData {
  int? id;
  String? title;
  String? description;
  int? price;

  ServiceData({this.id, this.title, this.description, this.price});

  ServiceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    return data;
  }
}