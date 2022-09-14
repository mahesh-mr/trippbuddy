// To parse this JSON data, do
//
//     final follow = followFromJson(jsonString);

import 'dart:convert';

FollowModel followFromJson(String str) => FollowModel.fromJson(json.decode(str));

String followToJson(FollowModel data) => json.encode(data.toJson());

class FollowModel {
    FollowModel({
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

    factory FollowModel.fromJson(Map<String, dynamic> json) => FollowModel(
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
