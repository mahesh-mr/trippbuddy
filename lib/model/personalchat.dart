// To parse this JSON data, do
//
//     final personalChat = personalChatFromJson(jsonString);

import 'dart:convert';

import 'package:trippbuddy/model/login.dart';

List<PersonalChat> personalChatFromJson(String str) => List<PersonalChat>.from(json.decode(str).map((x) => PersonalChat.fromJson(x)));

String personalChatToJson(List<PersonalChat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonalChat {
    PersonalChat({
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
    String ?content;
    Chat? chat;
    List<dynamic> ?readBy;
    DateTime ?createdAt;
    DateTime ?updatedAt;
    int? v;

    factory PersonalChat.fromJson(Map<String, dynamic> json) => PersonalChat(
        id: json["_id"],
        sender: Sender.fromJson(json["sender"]),
        content: json["content"],
        chat: Chat.fromJson(json["chat"]),
        readBy: List<dynamic>.from(json["readBy"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "sender": sender!.toJson(),
        "content": content,
        "chat": chat!.toJson(),
        "readBy": List<dynamic>.from(readBy!.map((x) => x)),
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

    String ?id;
    String? chatName;
    bool ?isGroupChat;
    List<String>? users;
    DateTime ?createdAt;
    DateTime? updatedAt;
    int? v;
    String ?latestMessage;

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["_id"],
        chatName: json["chatName"],
        isGroupChat: json["isGroupChat"],
        users: List<String>.from(json["users"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        latestMessage: json["latestMessage"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "chatName": chatName,
        "isGroupChat": isGroupChat,
        "users": List<dynamic>.from(users!.map((x) => x)),
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
    String ?pic;

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





// // To parse this JSON data, do
// //
// //     final personalChat = personalChatFromJson(jsonString);

// import 'dart:convert';

// List<PersonalChat> personalChatFromJson(String str) => List<PersonalChat>.from(json.decode(str).map((x) => PersonalChat.fromJson(x)));

// String personalChatToJson(List<PersonalChat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class PersonalChat {
//     PersonalChat({
//         this.id,
//         this.sender,
//         this.content,
//         this.chat,
//         this.readBy,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//     });

//     String? id;
//     Sender? sender;
//     String? content;
//     Chat ?chat;
//     List<dynamic> ?readBy;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int ?v;

//     factory PersonalChat.fromJson(Map<String, dynamic> json) => PersonalChat(
//         id: json["_id"],
//         sender: Sender.fromJson(json["sender"]),
//         content: json["content"],
//         chat: Chat.fromJson(json["chat"]),
//         readBy: List<dynamic>.from(json["readBy"].map((x) => x)),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "sender": sender!.toJson(),
//         "content": content,
//         "chat": chat!.toJson(),
//         "readBy": List<dynamic>.from(readBy!.map((x) => x)),
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//         "__v": v,
//     };
// }

// class Chat {
//     Chat({
//         this.id,
//         this.chatName,
//         this.isGroupChat,
//         this.users,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.latestMessage,
//     });

//     Id ?id;
//     ChatName? chatName;
//     bool? isGroupChat;
//     List<IdElement>? users;
//     DateTime ?createdAt;
//     DateTime? updatedAt;
//     int? v;
//     LatestMessage ?latestMessage;

//     factory Chat.fromJson(Map<String, dynamic> json) => Chat(
//         id: idValues.map![json["_id"]],
//         chatName: chatNameValues.map![json["chatName"]],
//         isGroupChat: json["isGroupChat"],
//         users: List<IdElement>.from(json["users"].map((x) => idElementValues.map![x])),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         latestMessage: latestMessageValues.map![json["latestMessage"]],
//     );

//   get length => null;

//     Map<String, dynamic> toJson() => {
//         "_id": idValues.reverse[id],
//         "chatName": chatNameValues.reverse[chatName],
//         "isGroupChat": isGroupChat,
//         "users": List<dynamic>.from(users!.map((x) => idElementValues.reverse[x])),
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//         "__v": v,
//         "latestMessage": latestMessageValues.reverse[latestMessage],
//     };
// }

// enum ChatName { SENDER }

// final chatNameValues = EnumValues({
//     "sender": ChatName.SENDER
// });

// enum Id { THE_6300_F6725462442_D502_C3_CAB }

// final idValues = EnumValues({
//     "6300f6725462442d502c3cab": Id.THE_6300_F6725462442_D502_C3_CAB
// });

// enum LatestMessage { THE_630_CB2589_F581_B870_C2_DB1_FC }

// final latestMessageValues = EnumValues({
//     "630cb2589f581b870c2db1fc": LatestMessage.THE_630_CB2589_F581_B870_C2_DB1_FC
// });

// enum IdElement { THE_63005_B8_FDAC9_B5_FBD2_F6_AB04 }

// final idElementValues = EnumValues({
//    //"6300f5935462442d502c3c34": IdElement.THE_6300_F5935462442_D502_C3_C34,
//     "63005b8fdac9b5fbd2f6ab04": IdElement.THE_63005_B8_FDAC9_B5_FBD2_F6_AB04,
   
// });

// class Sender {
//     Sender({




      
//         this.id,
//         this.name,
//         this.email,
//         this.pic,
//     });

//     IdElement? id;
//     Name? name;
//     Email? email;
//     String? pic;

//     factory Sender.fromJson(Map<String, dynamic> json) => Sender(
//         id: idElementValues.map![json["_id"]],
//         name: nameValues.map![json["name"]],
//         email: emailValues.map![json["email"]],
//         pic: json["pic"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": idElementValues.reverse[id],
//         "name": nameValues.reverse[name],
//         "email": emailValues.reverse[email],
//         "pic": pic,
//     };
// }

// enum Email { MS_GMAIL_COM, EE_GMAIL_COM }

// final emailValues = EnumValues({
//     "ee@gmail.com": Email.EE_GMAIL_COM,
//     "ms@gmail.com": Email.MS_GMAIL_COM
// });

// enum Name { MS, MIDHUN }

// final nameValues = EnumValues({
//     "Midhun": Name.MIDHUN,
//     "ms": Name.MS
// });

// class EnumValues<T> {
//     Map<String, T>? map;
//     Map<T, String>? reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map!.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap!;
//     }
// }
