// To parse this JSON data, do
//
//     final updatepost = updatepostFromJson(jsonString);

import 'dart:convert';

List<NewCreatePost>newcreatePostFromJson(String str) => List<NewCreatePost>.from(json.decode(str).map((x) => NewCreatePost.fromJson(x)));

String newcreatePostToJson(List<NewCreatePost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewCreatePost {
    NewCreatePost({
      required  this.title,
     required   this.photo,
        this.likes,
        this.postedBy,
        this.id,
        this.comments,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String title;
    String photo;
    List<dynamic>? likes;
    PostedBy? postedBy;
    String? id;
    List<dynamic>? comments;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory NewCreatePost.fromJson(Map<String, dynamic> json) => NewCreatePost(
        title: json["title"],
        photo: json["photo"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        postedBy: PostedBy.fromJson(json["postedBy"]),
        id: json["_id"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "photo": photo,
        "likes": List<dynamic>.from(likes!.map((x) => x)),
        "postedBy": postedBy!.toJson(),
        "_id": id,
        "comments": List<dynamic>.from(comments!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}

class PostedBy {
    PostedBy({
        this.id,
        this.name,
        this.email,
        this.pic,
        this.isBlocked,
        this.followers,
        this.following,
        this.v,
    });

    String? id;
    String? name;
    String? email;
    String? pic;
    bool? isBlocked;
    List<String>? followers;
    List<String>? following;
    int? v;

    factory PostedBy.fromJson(Map<String, dynamic> json) => PostedBy(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        pic: json["pic"],
        isBlocked: json["isBlocked"],
        followers: List<String>.from(json["followers"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "pic": pic,
        "isBlocked": isBlocked,
        "followers": List<dynamic>.from(followers!.map((x) => x)),
        "following": List<dynamic>.from(following!.map((x) => x)),
        "__v": v,
    };
}
