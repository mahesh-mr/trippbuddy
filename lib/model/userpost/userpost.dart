class UserPost {
  // User? user;
  List<UserPosts>? posts;

  UserPost({ this.posts});

  UserPost.fromJson(Map<String, dynamic> json) {
    // user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['posts'] != null) {
      posts = <UserPosts>[];
      json['posts'].forEach((v) {
        posts!.add(new UserPosts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.user != null) {
    //   data['user'] = this.user!.toJson();
    // }
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  String? pic;
  bool? isBlocked;
  List<String>? followers;
  List<void>? following;
  int? iV;

  User(
      {this.sId,
      this.name,
      this.email,
      this.pic,
      this.isBlocked,
      this.followers,
      this.following,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    pic = json['pic'];
    isBlocked = json['isBlocked'];
    followers = json['followers'].cast<String>();
    if (json['following'] != null) {
      following = <Null>[];
      json['following'].forEach((v) {
      //  following!.add( Null!.fromJson());
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
    data['followers'] = this.followers;
    if (this.following != null) {
      data['following'] = this.following!.map((v) => toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class UserPosts {
  User? user;

  String? sId;
  String? title;
  String? photo;
  List<String>? likes;
  PostedBy? postedBy;
  List<Comments>? comments;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserPosts(
      {this.sId,
      this.title,
      this.photo,
      this.likes,
      this.postedBy,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserPosts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    photo = json['photo'];
    likes = json['likes'].cast<String>();
    postedBy = json['postedBy'] != null
        ? new PostedBy.fromJson(json['postedBy'])
        : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['photo'] = this.photo;
    data['likes'] = this.likes;
    if (this.postedBy != null) {
      data['postedBy'] = this.postedBy!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class PostedBy {
  String? sId;
  String? name;

  PostedBy({this.sId, this.name});

  PostedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class Comments {
  String? text;
  String? postedBy;
  String? sId;

  Comments({this.text, this.postedBy, this.sId});

  Comments.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    postedBy = json['postedBy'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['postedBy'] = this.postedBy;
    data['_id'] = this.sId;
    return data;
  }
}