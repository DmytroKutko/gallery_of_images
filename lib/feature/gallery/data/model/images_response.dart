class ImagesResponse {
  int? total;
  int? totalHits;
  List<Hits>? hits;

  ImagesResponse({this.total, this.totalHits, this.hits});

  ImagesResponse.fromJson(Map<String, dynamic> json) {
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["totalHits"] is int) {
      totalHits = json["totalHits"];
    }
    if (json["hits"] is List) {
      hits = json["hits"] == null
          ? null
          : (json["hits"] as List).map((e) => Hits.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    data["totalHits"] = totalHits;
    if (hits != null) {
      data["hits"] = hits?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Hits {
  int? id;
  String? pageUrl;
  String? type;
  String? tags;
  String? previewUrl;
  int? previewWidth;
  int? previewHeight;
  String? webformatUrl;
  int? webformatWidth;
  int? webformatHeight;
  String? largeImageUrl;
  int? imageWidth;
  int? imageHeight;
  int? imageSize;
  int? views;
  int? downloads;
  int? collections;
  int? likes;
  int? comments;
  int? userId;
  String? user;
  String? userImageUrl;

  Hits({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  Hits.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["pageURL"] is String) {
      pageUrl = json["pageURL"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["tags"] is String) {
      tags = json["tags"];
    }
    if (json["previewURL"] is String) {
      previewUrl = json["previewURL"];
    }
    if (json["previewWidth"] is int) {
      previewWidth = json["previewWidth"];
    }
    if (json["previewHeight"] is int) {
      previewHeight = json["previewHeight"];
    }
    if (json["webformatURL"] is String) {
      webformatUrl = json["webformatURL"];
    }
    if (json["webformatWidth"] is int) {
      webformatWidth = json["webformatWidth"];
    }
    if (json["webformatHeight"] is int) {
      webformatHeight = json["webformatHeight"];
    }
    if (json["largeImageURL"] is String) {
      largeImageUrl = json["largeImageURL"];
    }
    if (json["imageWidth"] is int) {
      imageWidth = json["imageWidth"];
    }
    if (json["imageHeight"] is int) {
      imageHeight = json["imageHeight"];
    }
    if (json["imageSize"] is int) {
      imageSize = json["imageSize"];
    }
    if (json["views"] is int) {
      views = json["views"];
    }
    if (json["downloads"] is int) {
      downloads = json["downloads"];
    }
    if (json["collections"] is int) {
      collections = json["collections"];
    }
    if (json["likes"] is int) {
      likes = json["likes"];
    }
    if (json["comments"] is int) {
      comments = json["comments"];
    }
    if (json["user_id"] is int) {
      userId = json["user_id"];
    }
    if (json["user"] is String) {
      user = json["user"];
    }
    if (json["userImageURL"] is String) {
      userImageUrl = json["userImageURL"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["pageURL"] = pageUrl;
    data["type"] = type;
    data["tags"] = tags;
    data["previewURL"] = previewUrl;
    data["previewWidth"] = previewWidth;
    data["previewHeight"] = previewHeight;
    data["webformatURL"] = webformatUrl;
    data["webformatWidth"] = webformatWidth;
    data["webformatHeight"] = webformatHeight;
    data["largeImageURL"] = largeImageUrl;
    data["imageWidth"] = imageWidth;
    data["imageHeight"] = imageHeight;
    data["imageSize"] = imageSize;
    data["views"] = views;
    data["downloads"] = downloads;
    data["collections"] = collections;
    data["likes"] = likes;
    data["comments"] = comments;
    data["user_id"] = userId;
    data["user"] = user;
    data["userImageURL"] = userImageUrl;
    return data;
  }
}
