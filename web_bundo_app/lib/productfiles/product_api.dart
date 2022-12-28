


import 'dart:convert';

List<Products1> productsFromJson(String str) =>
    List<Products1>.from(json.decode(str).map((x) => Products1.fromJson(x)));

String productsToJson(List<Products1> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products1 {
  int? id;
  String? name;
  int? price;
  String? image;
  String? band;
  String? category;

  Products1(
      {this.id, this.name, this.price, this.image, this.band, this.category});

  Products1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    band = json['band'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['band'] = this.band;
    data['category'] = this.category;
    return data;
  }
}
