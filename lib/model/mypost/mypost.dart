class MyPostModel {
  List<Myposts>? myposts;

  MyPostModel({this.myposts});

  MyPostModel.fromJson(Map<String, dynamic> json) {
    if (json['myposts'] != null) {
      myposts = <Myposts>[];
      json['myposts'].forEach((v) {
        myposts!.add(new Myposts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myposts != null) {
      data['posts'] = this.myposts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Myposts {
  String? sId;
  String? title;
  String? photo;
  List<String>? likes;
  PostedBy? postedBy;
  List<Comments>? comments;
  String? createdAt;
  String? updatedAt;


  Myposts(
      {
        required this.sId,
      this.title,
      this.photo,
      this.likes,
      this.postedBy,
      this.comments,
      this.createdAt,
      this.updatedAt,
  });

  Myposts.fromJson(Map<String, dynamic> json) {
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