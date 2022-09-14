 
class PostsModel {
  List<Posts>? posts;

  PostsModel({this.posts});

  PostsModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? sId;
  String? title;
  String? photo;
  List<String>? likes;
  PostedBy? postedBy;
  List<Comments>? comments;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Posts(
      {this.sId,
      this.title,
      this.photo,
      this.likes,
      this.postedBy,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Posts.fromJson(Map<String, dynamic> json) {
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
  String? pic;

  PostedBy({this.sId, this.name, this.pic});

  PostedBy.fromJson(Map<String, dynamic> json) {
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

class Comments {
  String? text;
  PostedBy? postedBy;
  String? sId;

  Comments({this.text, this.postedBy, this.sId});

  Comments.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    postedBy = json['postedBy'] != null
        ? new PostedBy.fromJson(json['postedBy'])
        : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.postedBy != null) {
      data['postedBy'] = this.postedBy!.toJson();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class PostedByUser {
  String? sId;
  String? name;

  PostedByUser({this.sId, this.name});

  PostedByUser.fromJson(Map<String, dynamic> json) {
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