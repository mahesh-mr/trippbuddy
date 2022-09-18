// To parse this JSON data, do
//
//     final deleteComentModel = deleteComentModelFromJson(jsonString);

import 'dart:convert';

DeleteCntModel deleteComentModelFromJson(String str) =>
    DeleteCntModel.fromJson(json.decode(str));

String deleteComentModelToJson(DeleteCntModel data) =>
    json.encode(data.toJson());

class DeleteCntModel {
  DeleteCntModel({
    this.id,
    this.title,
    this.photo,
    this.likes,
    this.postedBy,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? title;
  String? photo;
  List<dynamic>? likes;
  String? postedBy;
  List<Comment>? comments;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory DeleteCntModel.fromJson(Map<String, dynamic> json) =>
      DeleteCntModel(
        id: json["_id"],
        title: json["title"],
        photo: json["photo"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        postedBy: json["postedBy"],
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "photo": photo,
        "likes": List<dynamic>.from(likes!.map((x) => x)),
        "postedBy": postedBy,
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class Comment {
  Comment({
    this.postedBy,
    this.id,
    this.text,
  });

  PostedBy? postedBy;
  String? id;
  String? text;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        postedBy: PostedBy.fromJson(json["postedBy"]),
        id: json["_id"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "postedBy": postedBy!.toJson(),
        "_id": id,
        "text": text == null ? null : text,
      };
}

class PostedBy {
  PostedBy({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory PostedBy.fromJson(Map<String, dynamic> json) => PostedBy(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
