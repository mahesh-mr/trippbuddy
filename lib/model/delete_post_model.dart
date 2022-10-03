// To parse this JSON data, do
//
//     final deletePost = deletePostFromJson(jsonString);

import 'dart:convert';

DeletePost deletePostFromJson(String str) => DeletePost.fromJson(json.decode(str));

String deletePostToJson(DeletePost data) => json.encode(data.toJson());

class DeletePost {
    DeletePost({
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
    PostedBy? postedBy;
    List<Comment>? comments;
    DateTime? createdAt;
    DateTime? updatedAt;
    int ?v;

    factory DeletePost.fromJson(Map<String, dynamic> json) => DeletePost(
        id: json["_id"],
        title: json["title"],
        photo: json["photo"],
        likes: List<String>.from(json["likes"].map((x) => x)),
        postedBy: PostedBy.fromJson(json["postedBy"]),
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
        "postedBy": postedBy!.toJson(),
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
    });

    String? postedBy;
    String? id;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        postedBy: json["postedBy"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "postedBy": postedBy,
        "_id": id,
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
