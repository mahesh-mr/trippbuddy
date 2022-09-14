// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        this.token,
        this.user,
        this.type,
    });

    String? token;
    User? user;
    String? type;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
        user: User.fromJson(json["user"]),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user!.toJson(),
        "type": type,
    };
}

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.followers,
        this.following,
        this.pic,
    });

    String? id;
    String? name;
    String? email;
    List<String>? followers;
    List<String>? following;
    String ?pic;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        followers: List<String>.from(json["followers"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
        pic: json["pic"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "followers": List<dynamic>.from(followers!.map((x) => x)),
        "following": List<dynamic>.from(following!.map((x) => x)),
        "pic": pic,
    };
}
