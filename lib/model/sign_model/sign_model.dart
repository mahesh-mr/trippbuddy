// import 'dart:convert';

// LoginModel loginModelFromJson(String str) =>
//     LoginModel.fromJson(json.decode(str));

// String loginModelToJson(LoginModel data) => json.encode(data.toJson());

// class LoginModel {
//   LoginModel({
//     this.success,
//     required this.user,
//     this.token,
//   });

//   bool? success;
//   User user;
//   String? token;

//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         success: json["success"],
//         user: User.fromJson(json["user"]),
//         token: json["token"],
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "user": user.toJson(),
//         "token": token,
//       };
// }

// class User {
//   User({
//     required this.avatar,
//     this.id,
//     required this.name,
//     required this.email,
//     required this.password,
//     this.posts,
//     this.story,
//     this.followers,
//     this.following,
//     this.blockStatus,
//     this.v,
//   });

//   Avatar avatar;
//   String? id;
//   String name;
//   String email;
//   String password;
//   List<dynamic>? posts;
//   List<dynamic>? story;
//   List<dynamic>? followers;
//   List<dynamic>? following;
//   bool? blockStatus;
//   int? v;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         avatar: Avatar.fromJson(json["avatar"]),
//         id: json["_id"],
//         name: json["name"],
//         email: json["email"],
//         password: json["password"],
//         posts: List<dynamic>.from(json["posts"].map((x) => x)),
//         story: List<dynamic>.from(json["story"].map((x) => x)),
//         followers: List<dynamic>.from(json["followers"].map((x) => x)),
//         following: List<dynamic>.from(json["following"].map((x) => x)),
//         blockStatus: json["blockStatus"],
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "avatar": avatar.toJson(),
//         "_id": id,
//         "name": name,
//         "email": email,
//         "password": password,
//         "posts": List<dynamic>.from(posts!.map((x) => x)),
//         "story": List<dynamic>.from(story!.map((x) => x)),
//         "followers": List<dynamic>.from(followers!.map((x) => x)),
//         "following": List<dynamic>.from(following!.map((x) => x)),
//         "blockStatus": blockStatus,
//         "__v": v,
//       };
// }

// class Avatar {
//   Avatar({
//     required this.publicId,
//     required this.url,
//   });

//   String publicId;
//   String url;

//   factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
//         publicId: json["public_id"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "public_id": publicId,
//         "url": url,
//       };
// }
