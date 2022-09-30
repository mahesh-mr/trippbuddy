// To parse this JSON data, do
//
//     final postChat = postChatFromJson(jsonString);

import 'dart:convert';

PostChat postChatFromJson(String str) => PostChat.fromJson(json.decode(str));

String postChatToJson(PostChat data) => json.encode(data.toJson());

class PostChat {
    PostChat({
        this.sender,
        this.content,
        this.chat,
        this.readBy,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    Sender? sender;
    String ?content;
    Chat? chat;
    List<dynamic>? readBy;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int ?v;

    factory PostChat.fromJson(Map<String, dynamic> json) => PostChat(
        sender: Sender.fromJson(json["sender"]),
        content: json["content"],
        chat: Chat.fromJson(json["chat"]),
        readBy: List<dynamic>.from(json["readBy"].map((x) => x)),
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "sender": sender!.toJson(),
        "content": content,
        "chat": chat!.toJson(),
        "readBy": List<dynamic>.from(readBy!.map((x) => x)),
        "_id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}

class Chat {
    Chat({
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
    List<Sender>? users;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? latestMessage;

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["_id"],
        chatName: json["chatName"],
        isGroupChat: json["isGroupChat"],
        users: List<Sender>.from(json["users"].map((x) => Sender.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        latestMessage: json["latestMessage"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "chatName": chatName,
        "isGroupChat": isGroupChat,
        "users": List<dynamic>.from(users!.map((x) => x.toJson())),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "latestMessage": latestMessage,
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
        email: json["email"] == null ? null : json["email"],
        pic: json["pic"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email == null ? null : email,
        "pic": pic,
    };
}
