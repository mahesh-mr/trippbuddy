// To parse this JSON data, do
//
//     final recentChats = recentChatsFromJson(jsonString);

import 'dart:convert';

List<RecentChats> recentChatsFromJson(String str) => List<RecentChats>.from(json.decode(str).map((x) => RecentChats.fromJson(x)));

String recentChatsToJson(List<RecentChats> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecentChats {
    RecentChats({
        this.id,
    required    this.chatName,
   required     this.isGroupChat,
     required   this.users,
   required     this.createdAt,
        this.updatedAt,
       
     required  this.latestMessage,
    });

    String? id;
    String chatName;
    bool isGroupChat;
    List<User> users;
    DateTime createdAt;
    DateTime? updatedAt;
   
    LatestMessage latestMessage;

    factory RecentChats.fromJson(Map<String, dynamic> json) => RecentChats(
        id: json["_id"],
        chatName: json["chatName"],
        isGroupChat: json["isGroupChat"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
     
        latestMessage: LatestMessage.fromJson(json["latestMessage"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "chatName": chatName,
        "isGroupChat": isGroupChat,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      
        "latestMessage": latestMessage.toJson(),
    };
}

class LatestMessage {
    LatestMessage({
    required    this.id,
     required  this.sender,
       required   this.content,
     required     this.chat,
     required     this.readBy,
     required     this.createdAt,
      required    this.updatedAt,
  
    });

    String id;
    Sender sender;
    String content;
    String chat;
    List<dynamic> readBy;
    DateTime createdAt;
    DateTime updatedAt;
   

    factory LatestMessage.fromJson(Map<String, dynamic> json) => LatestMessage(
        id: json["_id"],
        sender: Sender.fromJson(json["sender"]),
        content: json["content"],
        chat: json["chat"],
        readBy: List<dynamic>.from(json["readBy"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
       
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "sender": sender.toJson(),
        "content": content,
        "chat": chat,
        "readBy": List<dynamic>.from(readBy.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
       
    };
}

class Sender {
    Sender({
    required      this.id,
    required      this.name,
     required     this.email,
    required      this.pic,
    });

    String id;
    String name;
    String email;
    String pic;

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
    required      this.id,
     required     this.name,
       this.email,
       required   this.pic,
        this.isBlocked,
        this.followers,
        this.following,
      
    });

    String id;
    String name;
    String? email;
    String pic;
    bool? isBlocked;
    List<String>? followers;
    List<String>? following;
 

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        pic: json["pic"],
        isBlocked: json["isBlocked"],
        followers: List<String>.from(json["followers"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
       
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "pic": pic,
        "isBlocked": isBlocked,
       
    };
}
