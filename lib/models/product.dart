// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.isFeatured,
    required this.name,
    required this.description,
    required this.size,
    required this.qty,
    required this.price,
    required this.height,
    required this.width,
    required this.discountedPrice,
    required this.category,
    required this.label,
    required this.created,
    required this.updated,
    required this.images,
  });

  String id;
  bool isFeatured;
  String name;
  String description;
  String size;
  int qty;
  int price;
  String height;
  String width;
  int discountedPrice;
  Category category;
  Label label;
  DateTime created;
  DateTime updated;
  List<Image> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    isFeatured: json["is_featured"],
    name: json["name"],
    description: json["description"],
    size: json["size"],
    qty: json["qty"],
    price: json["price"],
    height: json["height"],
    width: json["width"],
    discountedPrice: json["discounted_price"],
    category: Category.fromJson(json["category"]),
    label: Label.fromJson(json["label"]),
    created: DateTime.parse(json["created"]),
    updated: DateTime.parse(json["updated"]),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_featured": isFeatured,
    "name": name,
    "description": description,
    "size": size,
    "qty": qty,
    "price": price,
    "height": height,
    "width": width,
    "discounted_price": discountedPrice,
    "category": category.toJson(),
    "label": label.toJson(),
    "created": created.toIso8601String(),
    "updated": updated.toIso8601String(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  String id;
  String name;
  String description;
  String image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
  };
}

class Image {
  Image({
    required this.image,
    required this.isDefaultImage,
  });

  String image;
  bool isDefaultImage;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    image: json["image"],
    isDefaultImage: json["is_default_image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "is_default_image": isDefaultImage,
  };
}

class Label {
  Label({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}