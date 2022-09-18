import 'package:trippbuddy/view/buddys/singleuser.dart';

class AllUsers {
  List<Users>? users;

  AllUsers({this.users});

  AllUsers.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? sId;
  String? name;
  String? email;
  String? pic;
  bool? isBlocked;
  List<Followers>? followers;
  List<Followings>? following;
  int? iV;

  Users(
      {this.sId,
      this.name,
      this.email,
      this.pic,
      this.isBlocked,
      this.followers,
      this.following,
      this.iV});

  Users.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    pic = json['pic'];
    isBlocked = json['isBlocked'];
    if (json['followers'] != null) {
      followers = <Followers>[];
      json['followers'].forEach((v) {
        followers!.add(new Followers.fromJson(v));
      });
    }
    if (json['following'] != null) {
      following = <Followings>[];
      json['following'].forEach((v) {
        following!.add(new Followings.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['pic'] = this.pic;
    data['isBlocked'] = this.isBlocked;
    if (this.followers != null) {
      data['followers'] = this.followers!.map((v) => v.toJson()).toList();
    }
    if (this.following != null) {
      data['following'] = this.following!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Followers {
  String? sId;
  String? name;
  String? pic;

  Followers({this.sId, this.name, this.pic});

  Followers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['pic'] = this.pic;
    return data;
  }
}
class Followings {
  String? sId;
  String? name;
  String? pic;

  Followings({this.sId, this.name, this.pic});

  Followings.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['pic'] = this.pic;
    return data;
  }
}
