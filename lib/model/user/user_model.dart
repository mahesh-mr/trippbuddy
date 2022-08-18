class User {
  User({
    required this.data,
  });

  Data data;

  // factory User.fromJson(Map<String, dynamic> json) => User(
  //       data: Data.fromJson(json["data"]),
  //     );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}


class Data {
  Data({
    required this.email,
    required this.password,
   required this.name,
    required this.avatar,
  });

  String password;
  String email;
  String name;
  String avatar;

  // factory Data.fromJson(Map<String, dynamic> json) => Data(
  //       password: json["id"],
  //       email: json["email"],
  //       firstName: json["first_name"],
  //       lastName: json["last_name"],
  //       avatar: json["avatar"],
  //     );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "avatar": avatar,
      };
}