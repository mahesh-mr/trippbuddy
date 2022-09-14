// To parse this JSON data, do
//
//     final comments = commentsFromJson(jsonString);

import 'dart:convert';

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));

String commentsToJson(Comments data) => json.encode(data.toJson());

class Comments {
    Comments({
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
    String ?photo;
    List<String>? likes;
    CommentsPostedBy? postedBy;
    List<Comment>? comments;
    DateTime ?createdAt;
    DateTime? updatedAt;
    int? v;

    factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        id: json["_id"],
        title: json["title"],
        photo: json["photo"],
        likes: List<String>.from(json["likes"].map((x) => x)),
        postedBy: CommentsPostedBy.fromJson(json["postedBy"]),
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
        this.text,
        this.postedBy,
        this.id,
    });

    String? text;
    CommentPostedBy? postedBy;
    String ?id;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        text: json["text"],
        postedBy: CommentPostedBy.fromJson(json["postedBy"]),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "postedBy": postedBy!.toJson(),
        "_id": id,
    };
}

class CommentPostedBy {
    CommentPostedBy({
        this.id,
        this.name,
    });

    String? id;
    String? name;

    factory CommentPostedBy.fromJson(Map<String, dynamic> json) => CommentPostedBy(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}

class CommentsPostedBy {
    CommentsPostedBy({
        this.id,
        this.name,
        this.pic,
    });

    String? id;
    String? name;
    String? pic;

    factory CommentsPostedBy.fromJson(Map<String, dynamic> json) => CommentsPostedBy(
        id: json["_id"],
        name: json["name"],
        pic: json["pic"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "pic": pic,
    };
}
