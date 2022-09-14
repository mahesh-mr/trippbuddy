// To parse this JSON data, do
//
//     final singleUser = singleUserFromJson(jsonString);

import 'dart:convert';

SingleUser singleUserFromJson(String str) => SingleUser.fromJson(json.decode(str));

String singleUserToJson(SingleUser data) => json.encode(data.toJson());

class SingleUser {
    SingleUser({
        this.user,
        this.posts,
    });

    User? user;
    List<Post>? posts;

    factory SingleUser.fromJson(Map<String, dynamic> json) => SingleUser(
        user: User.fromJson(json["user"]),
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
    };
}

class Post {
    Post({
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
    PostedBy? postedBy;
    List<Comment>? comments;
    DateTime ?createdAt;
    DateTime? updatedAt;
    int? v;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
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
        this.text,
        this.postedBy,
        this.id,
    });

    String ?text;
    Id ?postedBy;
    String? id;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        text: json["text"] == null ? null : json["text"],
        postedBy: idValues.map![json["postedBy"]],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "postedBy": idValues.reverse[postedBy],
        "_id": id,
    };
}

enum Id { THE_62_FD153_B5_D5_ABF8_AFDE619_C0, THE_63005_B8_FDAC9_B5_FBD2_F6_AB04 }

final idValues = EnumValues({
    "62fd153b5d5abf8afde619c0": Id.THE_62_FD153_B5_D5_ABF8_AFDE619_C0,
    "63005b8fdac9b5fbd2f6ab04": Id.THE_63005_B8_FDAC9_B5_FBD2_F6_AB04
});

class PostedBy {
    PostedBy({
        this.id,
        this.name,
    });

    Id ?id;
    String ?name;

    factory PostedBy.fromJson(Map<String, dynamic> json) => PostedBy(
        id: idValues.map![json["_id"]],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
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

    Id? id;
    String? name;
    String ?email;
    String? pic;
    bool? isBlocked;
    List<Follower> ?followers;
    List<Follower>? following;
    int ?v;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: idValues.map![json["_id"]],
        name: json["name"],
        email: json["email"],
        pic: json["pic"],
        isBlocked: json["isBlocked"],
        followers: List<Follower>.from(json["followers"].map((x) => Follower.fromJson(x))),
        following: List<Follower>.from(json["following"].map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "name": name,
        "email": email,
        "pic": pic,
        "isBlocked": isBlocked,
        "followers": List<dynamic>.from(followers!.map((x) => x.toJson())),
        "following": List<dynamic>.from(following!.map((x) => x)),
        "__v": v,
    };
}

class Follower {
    Follower({
        this.id,
        this.name,
        this.pic,
    });

    String? id;
    String? name;
    String? pic;

    factory Follower.fromJson(Map<String, dynamic> json) => Follower(
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

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
