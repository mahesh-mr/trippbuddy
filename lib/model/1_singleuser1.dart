// To parse this JSON data, do
//
//     final singleuser = singleuserFromJson(jsonString);

import 'dart:convert';

Singleusers singleuserFromJson(String str) => Singleusers.fromJson(json.decode(str));

String singleuserToJson(Singleusers data) => json.encode(data.toJson());

class Singleusers {
    Singleusers({
        this.user,
        this.posts,
    });

    User? user;
    List<Postds>? posts;

    factory Singleusers.fromJson(Map<String, dynamic> json) => Singleusers(
        user: User.fromJson(json["user"]),
        posts: List<Postds>.from(json["posts"].map((x) => Postds.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
    };
}

class Postds {
    Postds({
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

    String ?id;
    String? title;
    String ?photo;
    List<String> ?likes;
    PostedBy? postedBy;
    List<dynamic>? comments;
    DateTime ?createdAt;
    DateTime ?updatedAt;
    int ?v;

    factory Postds.fromJson(Map<String, dynamic> json) => Postds(
        id: json["_id"],
        title: json["title"],
        photo: json["photo"],
        likes: List<String>.from(json["likes"].map((x) => x)),
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

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.pic,
        this.isBlocked,
        this.followers,
        this.following,
        this.v,
    });

    String ?id;
    String ?name;
    String ?email;
    String ?pic;
    bool ?isBlocked;
    List<Follow> ?followers;
    List<Follow> ?following;
    int ?v;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        pic: json["pic"],
        isBlocked: json["isBlocked"],
        followers: List<Follow>.from(json["followers"].map((x) => Follow.fromJson(x))),
        following: List<Follow>.from(json["following"].map((x) => Follow.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "pic": pic,
        "isBlocked": isBlocked,
        "followers": List<dynamic>.from(followers!.map((x) => x.toJson())),
        "following": List<dynamic>.from(following!.map((x) => x.toJson())),
        "__v": v,
    };
}

class Follow {
    Follow({
        this.id,
        this.name,
        this.pic,
    });

    String ?id;
    String ?name;
    String ?pic;

    factory Follow.fromJson(Map<String, dynamic> json) => Follow(
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
