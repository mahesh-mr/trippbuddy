// To parse this JSON data, do
//
//     final personalModel = personalModelFromJson(jsonString);

import 'dart:convert';

PersonalModel personalModelFromJson(String str) =>
    PersonalModel.fromJson(json.decode(str));

String personalModelToJson(PersonalModel data) => json.encode(data.toJson());

class PersonalModel {
  PersonalModel({
    this.id,
    this.chatName,
    this.isGroupChat,
    this.users,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.latestMessage,
  });

  String? id;
  String? chatName;
  bool? isGroupChat;
  List<User>? users;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  LatestMessage? latestMessage;

  factory PersonalModel.fromJson(Map<String, dynamic> json) => PersonalModel(
        id: json["_id"],
        chatName: json["chatName"],
        isGroupChat: json["isGroupChat"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        latestMessage: LatestMessage.fromJson(json["latestMessage"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "chatName": chatName,
        "isGroupChat": isGroupChat,
        "users": List<dynamic>.from(users!.map((x) => x.toJson())),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "latestMessage": latestMessage!.toJson(),
      };
}

class LatestMessage {
  LatestMessage({
    this.id,
    this.sender,
    this.content,
    this.chat,
    this.readBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  Sender? sender;
  String? content;
  String? chat;
  List<dynamic>? readBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory LatestMessage.fromJson(Map<String, dynamic> json) => LatestMessage(
        id: json["_id"],
        sender: Sender.fromJson(json["sender"]),
        content: json["content"],
        chat: json["chat"],
        readBy: List<dynamic>.from(json["readBy"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sender": sender!.toJson(),
        "content": content,
        "chat": chat,
        "readBy": List<dynamic>.from(readBy!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class Sender {
  Sender({
    this.id,
    this.name,
    this.email,
    this.pic,
  });

  String? id;
  String? name;
  String? email;
  String? pic;

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        pic: json["pic"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "pic": pic,
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

  String? id;
  String? name;
  String? email;
  String? pic;
  bool? isBlocked;
  List<String>? followers;
  List<String>? following;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
