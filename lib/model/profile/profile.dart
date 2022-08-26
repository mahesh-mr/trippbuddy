class ProfieDetails {
  List<UserData>? userData;

  ProfieDetails({this.userData});

  ProfieDetails.fromJson(Map<String, dynamic> json) {
    if (json['userData'] != null) {
      userData =<UserData>[];
      json['userData'].forEach((v){
        userData!.add(new UserData.fromJson(v));
      });
      
    }
  }
  //   userData = json['userData'] != null
  //       ? new UserData.fromJson(json['userData'])
  //       : null;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['userData'] = this.userData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData {
  String? sId;
  String? name;
  String? email;
  String? pic;
  bool? isBlocked;
  List<Followers>? followers;
  List<Following>? following;
  int? iV;

  UserData(
      {this.sId,
      this.name,
      this.email,
      this.pic,
      this.isBlocked,
      this.followers,
      this.following,
      this.iV});

  UserData.fromJson(Map<String, dynamic> json) {
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
      following = <Following>[];
      json['following'].forEach((v) {
        following!.add(new Following.fromJson(v));
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

class Following {
  String? sId;
  String? name;
  String? pic;

  Following({this.sId, this.name, this.pic});

  Following.fromJson(Map<String, dynamic> json) {
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