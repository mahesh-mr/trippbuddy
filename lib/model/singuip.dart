// To parse this JSON data, do
//
//     final signup = signupFromJson(jsonString);

import 'dart:convert';

SignupModel signupFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    SignupModel({
    
        this.user,
    });

   
    SignUser? user;

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
      
        user: SignUser.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
      
        "user": user!.toJson(),
    };
}

class SignUser {
    SignUser({
        this.name,
        this.email,
        this.password,
        this.pic,
        this.isBlocked,
        this.followers,
        this.following,
        this.id,
        this.v,
    });

    String? name;
    String? email;
    String? password;
    String ?pic;
    bool ?isBlocked;
    List<dynamic> ?followers;
    List<dynamic> ?following;
    String ?id;
    int ?v;

    factory SignUser.fromJson(Map<String, dynamic> json) => SignUser(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        pic: json["pic"],
        isBlocked: json["isBlocked"],
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "pic": pic,
        "isBlocked": isBlocked,
        "followers": List<dynamic>.from(followers!.map((x) => x)),
        "following": List<dynamic>.from(following!.map((x) => x)),
        "_id": id,
        "__v": v,
    };
}
