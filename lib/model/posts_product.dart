// To parse this JSON data, do
//
//     final postProduct = postProductFromJson(jsonString);

import 'dart:convert';

PostProduct postProductFromJson(String str) => PostProduct.fromJson(json.decode(str));

String postProductToJson(PostProduct data) => json.encode(data.toJson());

class PostProduct {
    PostProduct({
        this.result,
    });

    Result? result;

    factory PostProduct.fromJson(Map<String, dynamic> json) => PostProduct(
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
    };
}

class Result {
    Result({
        this.title,
        this.photo,
        this.postedBy,
        this.description,
        this.location,
        this.category,
        this.price,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? title;
    String? photo;
    PostedBy? postedBy;
    String? description;
    String? location;
    String? category;
    int? price;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        photo: json["photo"],
        postedBy: PostedBy.fromJson(json["postedBy"]),
        description: json["description"],
        location: json["location"],
        category: json["category"],
        price: json["price"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "photo": photo,
        "postedBy": postedBy!.toJson(),
        "description": description,
        "location": location,
        "category": category,
        "price": price,
        "_id": id,
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
        this.password,
        this.pic,
        this.isBlocked,
        this.followers,
        this.following,
        this.v,
    });

    String? id;
    String? name;
    String? email;
    String ?password;
    String? pic;
    bool ?isBlocked;
    List<String>? followers;
    List<String>? following;
    int? v;

    factory PostedBy.fromJson(Map<String, dynamic> json) => PostedBy(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
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
        "password": password,
        "pic": pic,
        "isBlocked": isBlocked,
        "followers": List<dynamic>.from(followers!.map((x) => x)),
        "following": List<dynamic>.from(following!.map((x) => x)),
        "__v": v,
    };
}
