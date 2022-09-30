// To parse this JSON data, do
//
//     final serchChat = serchChatFromJson(jsonString);

import 'dart:convert';

List<SerchChat> serchChatFromJson(String str) => List<SerchChat>.from(json.decode(str).map((x) => SerchChat.fromJson(x)));

String serchChatToJson(List<SerchChat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SerchChat {
    SerchChat({
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
    String? password;
    String? pic;
    bool
    ? isBlocked;
    List<String>? followers;
    List<String>? following;
    int? v;

    factory SerchChat.fromJson(Map<String, dynamic> json) => SerchChat(
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
