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
  List<String>? followers;
  List<String>? following;
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
    followers = json['followers'].cast<String>();
    following = json['following'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['pic'] = this.pic;
    data['isBlocked'] = this.isBlocked;
    data['followers'] = this.followers;
    data['following'] = this.following;
    data['__v'] = this.iV;
    return data;
  }
}