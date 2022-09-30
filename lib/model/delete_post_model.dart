// To parse this JSON data, do
//
//     final deletePostModel = deletePostModelFromJson(jsonString);

import 'dart:convert';

DeletePostModel deletePostModelFromJson(String str) => DeletePostModel.fromJson(json.decode(str));

String deletePostModelToJson(DeletePostModel data) => json.encode(data.toJson());

class DeletePostModel {
    DeletePostModel({
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
    PostedBy? postedBy;
    List<dynamic>? comments;
    DateTime? createdAt;
    DateTime? updatedAt;
    int ?v;

    factory DeletePostModel.fromJson(Map<String, dynamic> json) => DeletePostModel(
        id: json["_id"],
        title: json["title"],
        photo: json["photo"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        postedBy: PostedBy.fromJson(json["postedBy"]),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "photo": photo,
        "likes": List<dynamic>.from(likes!.map((x) => x)),
        "postedBy": postedBy!.toJson(),
        "comments": List<dynamic>.from(comments!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}

class PostedBy {
    PostedBy({
        this.id,
    });

    String? id;

    factory PostedBy.fromJson(Map<String, dynamic> json) => PostedBy(
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
    };
}
