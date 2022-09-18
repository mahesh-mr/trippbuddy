// To parse this JSON data, do
//
//     final editposttModel = editposttModelFromJson(jsonString);

import 'dart:convert';

EditposttModel editposttModelFromJson(String str) => EditposttModel.fromJson(json.decode(str));

String editposttModelToJson(EditposttModel data) => json.encode(data.toJson());

class EditposttModel {
    EditposttModel({
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
    List<String>? likes;
    String? postedBy;
    List<Comment> ?comments;
    DateTime ?createdAt;
    DateTime ?updatedAt;
    int ?v;

    factory EditposttModel.fromJson(Map<String, dynamic> json) => EditposttModel(
        id: json["_id"],
        title: json["title"],
        photo: json["photo"],
        likes: List<String>.from(json["likes"].map((x) => x)),
        postedBy: json["postedBy"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
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
        this.text,
        this.postedBy,
        this.id,
    });

    String ?text;
    String? postedBy;
    String ?id;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        text: json["text"],
        postedBy: json["postedBy"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "postedBy": postedBy,
        "_id": id,
    };
}
