// To parse this JSON data, do
//
//     final myprofile = myprofileFromJson(jsonString);

import 'dart:convert';

Myprofile myprofileFromJson(String str) => Myprofile.fromJson(json.decode(str));

String myprofileToJson(Myprofile data) => json.encode(data.toJson());

class Myprofile {
    Myprofile({
        this.userData,
    });

    UserData? userData;

    factory Myprofile.fromJson(Map<String, dynamic> json) => Myprofile(
        userData: UserData.fromJson(json["userData"]),
    );

    Map<String, dynamic> toJson() => {
        "userData": userData!.toJson(),
    };
}

class UserData {
    UserData({
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
    String? name;
    String? email;
    String? pic;
    bool? isBlocked;
    List<Follow>? followers;
    List<Follow>? following;
    int? v;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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
    String? name;
    String? pic;

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
