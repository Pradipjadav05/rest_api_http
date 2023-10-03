class PostsModel {
  late final int? userId;
  late final int? id;
  late final String? title;
  late final String? body;

  PostsModel({
    this.userId,
    this.id,
    this.title,
    this.body
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "id": id,
      "title": title,
      "body": body
    };
  }
}

