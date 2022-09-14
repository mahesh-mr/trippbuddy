class editpost {
  Post? post;

  editpost({this.post});

  editpost.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    return data;
  }
}

class Post {
  String? sId;
  String? title;
  String? photo;
  List<Null>? likes;
  PostedBy? postedBy;
  List<Null>? comments;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Post(
      {this.sId,
      this.title,
      this.photo,
      this.likes,
      this.postedBy,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Post.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    photo = json['photo'];
    if (json['likes'] != null) {
      likes = <Null>[];
      json['likes'].forEach((v) {
      //  likes!.add(new Null.fromJson(v));
      });
    }
    postedBy = json['postedBy'] != null
        ? new PostedBy.fromJson(json['postedBy'])
        : null;
    if (json['comments'] != null) {
      comments = <Null>[];
      json['comments'].forEach((v) {
   //     comments!.add(new Null.fromJson(v));
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
    if (this.likes != null) {
    data['likes'] = this.likes!.map((v) => toJson()).toList();
    }
    if (this.postedBy != null) {
      data['postedBy'] = this.postedBy!.toJson();
    }
    if (this.comments != null) {
  data['comments'] = this.comments!.map((v) => toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class PostedBy {
  String? sId;

  PostedBy({this.sId});

  PostedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    return data;
  }
}