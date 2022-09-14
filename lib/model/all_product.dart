class AllProductModel {
  List<Products>? products;

  AllProductModel({this.products});

  AllProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? sId;
  String? title;
  String? photo;
  PostedBy? postedBy;
  String? description;
  String? location;
  String? category;
  int? price;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Products(
      {this.sId,
      this.title,
      this.photo,
      this.postedBy,
      this.description,
      this.location,
      this.category,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    photo = json['photo'];
    postedBy = json['postedBy'] != null
        ? new PostedBy.fromJson(json['postedBy'])
        : null;
    description = json['description'];
    location = json['location'];
    category = json['category'];
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['photo'] = this.photo;
    if (this.postedBy != null) {
      data['postedBy'] = this.postedBy!.toJson();
    }
    data['description'] = this.description;
    data['location'] = this.location;
    data['category'] = this.category;
    data['price'] = this.price;
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